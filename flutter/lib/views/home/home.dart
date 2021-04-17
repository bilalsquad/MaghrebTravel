import 'package:flutter/material.dart';
import 'package:mon_app/providers/city_provider.dart';
import 'package:mon_app/views/home/widgets/citycard.dart';
import 'package:mon_app/widgets/Drawermain.dart';
import 'package:provider/provider.dart';
import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    return Scaffold(
      appBar: AppBar(
        title: Text('Maghreb Travel'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      drawer: Drawermain(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cities.map((city) => CityCard(city: city)).toList(),
        ),
      ),
    );
  }
}
