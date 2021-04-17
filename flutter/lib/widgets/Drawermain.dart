import 'package:flutter/material.dart';

import '../views/home/home.dart';
import '../views/trips/trips_view.dart';

class Drawermain extends StatelessWidget {
  const Drawermain();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'MaghrebTravel',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Acceuil'),
            onTap: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes voyages'),
            onTap: () {
              Navigator.pushNamed(context, TripsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
