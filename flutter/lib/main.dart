import 'package:flutter/material.dart';
import 'package:mon_app/providers/city_provider.dart';
import 'package:mon_app/providers/trip_provider.dart';
import 'package:mon_app/views/trip/trip_view.dart';
import 'package:provider/provider.dart';

import './views/city/city.dart';
import './views/home/home.dart';
import './views/404/notfound.dart';
import './views/trips/trips_view.dart';

main() {
  runApp(MaghrebTravel());
}

class MaghrebTravel extends StatefulWidget {
  @override
  _MaghrebTravelState createState() => _MaghrebTravelState();
}

class _MaghrebTravelState extends State<MaghrebTravel> {
  final CityProvider cityProvider = CityProvider();
  @override
  void initState() {
    cityProvider.fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeView(),
          CityView.routeName: (_) => CityView(),
          TripsView.routeName: (_) => TripsView(),
          TripView.routeName: (_) => TripView(),
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => NotFound(),
        ),
      ),
    );
  }
}
