import 'package:flutter/material.dart';
import 'package:mon_app/models/city_model.dart';

class TripCityBar extends StatelessWidget {
  final City city;

  TripCityBar({this.city});

  @override
  Widget build(BuildContext context) {
    print('Trip City bar');
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.network(
            city.image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black38,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.arrow_back, size: 30, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Text(
                  city.name,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
