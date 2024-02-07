import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/models/country.dart';
import 'package:shop_app/screens/country/utils.dart';

class CountryProvider with ChangeNotifier {
  CountryProvider() {
    loadCountries().then((countries) {
      _countries = countries;
      notifyListeners();
    });
  }

  List<Country> _countries = [];

  List<Country> get countries => _countries;

  Future loadCountries() async {
    final data = await rootBundle.loadString('assets/country_codes.json');
    final countriesJson = json.decode(data);
   //print(data);
   // print(countriesJson);
    return countriesJson.keys.map<Country>((code) {
      final json =  countriesJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});
        //print(newJson);
      return Country.fromJson(newJson);
    }).toList()
      ..sort(Utils.ascendingSort);
  }
}
