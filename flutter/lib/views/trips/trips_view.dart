import 'package:flutter/material.dart';
import 'package:mon_app/providers/trip_provider.dart';
import 'package:mon_app/widgets/Loarder.dart';
import 'package:provider/provider.dart';
import '../../views/trips/widgets/trips_list.dart';

import '../../widgets/Drawermain.dart';

class TripsView extends StatelessWidget {
  static const String routeName = '/trips';
  @override
  Widget build(BuildContext context) {
    TripProvider tripProvider = Provider.of<TripProvider>(context);
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
        body: tripProvider.isLoading != true
            ? tripProvider.trips.length > 0
                ? TabBarView(
                    children: <Widget>[
                      TripList(
                        trips: tripProvider.trips
                            .where((trip) => DateTime.now().isBefore(trip.date))
                            .toList(),
                      ),
                      TripList(
                        trips: tripProvider.trips
                            .where((trip) => DateTime.now().isAfter(trip.date))
                            .toList(),
                      ),
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text('Aucun Voyage pour le moment'),
                  )
            : Loader(),
      ),
    );
  }
}
