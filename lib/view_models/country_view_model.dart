import 'package:country_api/models/country.dart';
import 'package:country_api/services/api_service.dart';
import 'package:country_api/utils/helpers.dart';
import 'package:flutter/material.dart';

class CountryViewModel extends ChangeNotifier {
  final ApiService apiService;
  List<Country> _countries = [];
  bool _isLoading = false;
  String _error = '';

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  String get error => _error;

  CountryViewModel({required this.apiService});

//Fetch countries from API
  Future<void> fetchCountries() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _countries = await apiService.getEuropeanCountries();
    } catch (e) {
      _error = errorMsg;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

//Sorting function for countries
  void sortCountries(SortCriteria criteria) {
    switch (criteria) {
      case SortCriteria.name:
        _countries.sort((a, b) => a.name.common.compareTo(b.name.common));
        break;
      case SortCriteria.capital:
        _countries.sort((a, b) => a.capital.first.compareTo(b.capital.first));
        break;
      case SortCriteria.population:
        _countries.sort((a, b) => a.population.compareTo(b.population));
        break;
    }
    notifyListeners();
  }
}

enum SortCriteria { name, capital, population }
