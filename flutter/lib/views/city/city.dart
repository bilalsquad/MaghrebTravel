import 'package:flutter/material.dart';
import 'package:mon_app/providers/city_provider.dart';
import 'package:mon_app/providers/trip_provider.dart';
import 'package:mon_app/views/city/widget/trip_overview.dart';
import 'package:provider/provider.dart';

import './widget/trip_activity_list.dart';
import './widget/activity_list.dart';
import './widget/trip_overview.dart';
import '../../views/home/home.dart';
import '../../widgets/Drawermain.dart';

import '../../models/city_model.dart';
import '../../models/activity.model.dart';
import '../../models/trip.model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<CityView> {
  Trip mytrip;
  int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    mytrip = Trip(activities: [], date: null, city: null, id: null);
  }

  double get amount {
    return mytrip.activities.fold(0.0, (prev, element) {
      return prev + element.price;
    });
  }

  void setDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days: 1)),
            firstDate: DateTime.now(),
            lastDate: DateTime(2022))
        .then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(Activity activity) {
    setState(() {
      mytrip.activities.contains(activity)
          ? mytrip.activities.remove(activity)
          : mytrip.activities.add(activity);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      mytrip.activities.remove(activity);
    });
  }

  void saveTrip(String cityName) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Voulez vous sauvegarder ?'),
          contentPadding: const EdgeInsets.all(20),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('annuler'),
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text(
                    'sauvegarder',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                ),
              ],
            )
          ],
        );
      },
    );
    if (mytrip.date == null && result == 'save') {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Attention !'),
          content: Text("Vous n'avez pas entré de date"),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    }
    if (result == 'save') {
      Provider.of<TripProvider>(context, listen: false).addTrip(mytrip);
      mytrip.city = cityName;
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context).settings.arguments;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation voyage'),
      ),
      drawer: const Drawermain(),
      body: Container(
        child: Column(
          children: <Widget>[
            Tripoverview(
                cityName: city.name,
                trip: mytrip,
                setDate: setDate,
                amount: amount),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: city.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: mytrip.activities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: () {
          saveTrip(city.name);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: 'Découverte',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.stars),
            label: 'Mes activités',
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}
