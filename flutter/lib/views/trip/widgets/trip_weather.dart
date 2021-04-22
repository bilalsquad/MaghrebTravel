import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../widgets/Loarder.dart';

class TripWeather extends StatelessWidget {
  final String cityName;
  final String hostBase = 'https://api.openweathermap.org/data/2.5/weather?q=';
  final String apiKey = '&appid=f1e7849034e9b782b7ebbd05ca27555e';

  TripWeather({this.cityName});

  String get query => '$hostBase$cityName$apiKey';

  Future<String> get getWeather {
    return http.get(Uri.parse(query)).then((http.Response response) {
      Map<String, dynamic> body = json.decode(response.body);
      print(response.body);
      print(cityName);
      print('suecces');
      return body['weather'][0]['icon'] as String;
    }).catchError((e) {
      print('error');
      return 'error';
    });
  }

  String getIconUrl(String iconName) {
    return 'https://openweathermap.org/img/wn/$iconName@2x.png';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        } else if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Météo',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  getIconUrl(snapshot.data),
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          );
        } else {
          return Loader();
        }
      },
    );
  }
}
