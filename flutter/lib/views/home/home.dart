import 'package:flutter/material.dart';
import 'package:mon_app/providers/city_provider.dart';
import 'package:mon_app/views/home/widgets/citycard.dart';
import 'package:mon_app/widgets/Drawermain.dart';
import 'package:mon_app/widgets/Loarder.dart';
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
      body: Column(
        children: [
          TextField(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: cities.length > 0
                  ? RefreshIndicator(
                      child: ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context, i) => CityCard(city: cities[i]),
                      ),
                      onRefresh: Provider.of<CityProvider>(context).fetchData,
                    )
                  : Loader(),
            ),
          ),
        ],
      ),
    );
  }
}
