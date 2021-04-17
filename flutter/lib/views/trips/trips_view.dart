import 'package:flutter/material.dart';
import 'package:mon_app/providers/trip_provider.dart';
import 'package:provider/provider.dart';
import '../../views/trips/widgets/trips_list.dart';

import '../../models/trip.model.dart';
import '../../widgets/Drawermain.dart';

class TripsView extends StatelessWidget {
  static const String routeName = '/trips';
  @override
  Widget build(BuildContext context) {
    List<Trip> trips = Provider.of<TripProvider>(context).trips;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Mes voyages'),
            bottom: const TabBar(
              tabs: <Widget>[
                const Tab(
                  text: 'A venir',
                ),
                const Tab(
                  text: 'Passés',
                ),
              ],
            ),
          ),
          drawer: const Drawermain(),
          body: TabBarView(
            children: <Widget>[
              TripList(
                trips: trips
                    .where((trip) => DateTime.now().isBefore(trip.date))
                    .toList(),
              ),
              TripList(
                trips: trips
                    .where((trip) => DateTime.now().isAfter(trip.date))
                    .toList(),
              ),
            ],
          )),
    );
  }
}
