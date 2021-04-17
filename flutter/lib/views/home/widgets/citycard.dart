import 'package:flutter/material.dart';

import '../../../models/city_model.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                image: AssetImage(city.image),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/city',
                      arguments: city.name,
                    );
                  },
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: Colors.black54,
                  child: Text(
                    city.name,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
