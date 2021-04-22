import 'package:flutter/material.dart';
import 'package:mon_app/models/activity.model.dart';

import 'package:mon_app/models/city_model.dart';

import 'package:mon_app/providers/city_provider.dart';
import 'package:mon_app/providers/trip_provider.dart';

import 'package:mon_app/views/trip/widgets/trip_activities.dart';
import 'package:mon_app/views/trip/widgets/trip_city_bar.dart';
import 'package:mon_app/views/trip/widgets/trip_weather.dart';
import 'package:provider/provider.dart';

class TripView extends StatelessWidget {
  static const String routeName = '/trip';
  @override
  Widget build(BuildContext context) {
    final String cityName = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['cityName'];
    final String tripId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['tripId'];
    final City city = Provider.of<CityProvider>(context, listen: false)
        .getCityByName(cityName);
    final Activity firstactivity =
        Provider.of<TripProvider>(context, listen: false)
            .getCityTripByName(tripId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TripCityBar(
                city: city,
              ),
              TripWeather(
                cityName: firstactivity.city,
              ),
              TripActivities(
                tripId: tripId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
