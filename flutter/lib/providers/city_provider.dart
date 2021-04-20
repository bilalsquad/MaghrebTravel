import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/city_model.dart';
import 'package:http/http.dart' as http;

class CityProvider with ChangeNotifier {
  final String host = 'http://10.0.2.2:80';
  List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/cities'));
      if (response.statusCode == 200) {
        _cities = (json.decode(response.body) as List)
            .map((cityJson) => City.fromJson(cityJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
