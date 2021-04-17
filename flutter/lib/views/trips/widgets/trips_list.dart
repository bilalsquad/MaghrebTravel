import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mon_app/models/trip.model.dart';
import 'package:mon_app/views/trip/trip_view.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;

  TripList({this.trips});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, i) {
        var trip = trips[i];
        return ListTile(
          title: Text(trip.city),
          subtitle: trip.date != null
              ? Text(
                  DateFormat("d/M/y").format(trip.date),
                )
              : null,
          onTap: () {
            Navigator.pushNamed(context, TripView.routeName,
                arguments: {'tripId': trip.id, 'cityName': trip.city});
          },
          trailing: Icon(Icons.info),
        );
      },
    );
  }
}
