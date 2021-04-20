import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mon_app/models/city_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityProvider with ChangeNotifier {
  final List<City> _cities = [];
  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  void fetchData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://10.0.2.2:80/api/cities'));
      if (response.statusCode == 200) {
        print(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
