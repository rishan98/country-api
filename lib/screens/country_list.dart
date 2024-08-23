import 'package:country_api/screens/single_country.dart';
import 'package:country_api/utils/colors.dart';
import 'package:country_api/utils/size.dart';
import 'package:country_api/utils/string.dart';
import 'package:country_api/utils/style.dart';
import 'package:country_api/view_models/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListView extends StatefulWidget {
  const CountryListView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CountryListViewState createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  SortCriteria? _selectedCriteria;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CountryViewModel>(context);

    return Scaffold(
      backgroundColor: gray,
      appBar: AppBar(
        title: const Text(
          europeCountries,
          style: whiteTextStyle,
        ),
        backgroundColor: blue,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.error.isNotEmpty
              ? Center(child: Text(viewModel.error))
              : Padding(
                  padding: const EdgeInsets.all(size_16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: size_4),
                        child: Row(
                          children: [
                            const Text(sortByText, style: smallBlackTextStyle),
                            const SizedBox(width: size_16),
                            Container(
                              color: graphYellow,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: size_8),
                              child: DropdownButton<SortCriteria>(
                                value: _selectedCriteria,
                                onChanged: (criteria) {
                                  setState(() {
                                    _selectedCriteria = criteria;
                                  });
                                  if (criteria != null) {
                                    viewModel.sortCountries(criteria);
                                  }
                                },
                                items: const [
                                  DropdownMenuItem(
                                    value: SortCriteria.name,
                                    child: Text(sortByName),
                                  ),
                                  DropdownMenuItem(
                                    value: SortCriteria.capital,
                                    child: Text(sortByCapital),
                                  ),
                                  DropdownMenuItem(
                                    value: SortCriteria.population,
                                    child: Text(sortByPopulation),
                                  ),
                                ],
                                hint: const Text(select),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: size_8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.countries.length,
                          itemBuilder: (context, index) {
                            final country = viewModel.countries[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        CountryDetailView(country: country),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(size_8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(size_12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: size_16),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: size_100,
                                        width: size_100,
                                        child: Image.network(country.flags.png),
                                      ),
                                      const SizedBox(width: size_16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(country.name.common),
                                          Text(country.capital.first),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
