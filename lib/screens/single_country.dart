import 'package:country_api/models/country.dart';
import 'package:country_api/utils/helpers.dart';
import 'package:flutter/material.dart';

class CountryDetailView extends StatelessWidget {
  final Country country;

  const CountryDetailView({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name.common,
          style: whiteTextStyle,
        ),
        backgroundColor: blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(size_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(country.flags.png),
            ),
            const SizedBox(height: size_16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(size_20),
              decoration: BoxDecoration(
                  color: yellow, borderRadius: BorderRadius.circular(size_12)),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1), 
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(
                    color: Colors.grey),
                children: [
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(size_8),
                      child:
                          Text(officalName, style: blackGray16TextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(size_8),
                      child: Text(country.name.official,
                          style: blackGray16TextStyle),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(size_8),
                      child: Text(population, style: blackGray16TextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(size_8),
                      child: Text('${country.population}',
                          style: blackGray16TextStyle),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(size_8),
                      child: Text(languages, style: blackGray16TextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(country.languages.values.join(", "),
                          style: blackGray16TextStyle),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
