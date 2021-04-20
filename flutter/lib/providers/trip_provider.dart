import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:flutter/widgets.dart';
import 'package:mon_app/models/activity.model.dart';
import 'package:mon_app/models/trip.model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TripProvider with ChangeNotifier {
  final String host = 'http://10.0.2.2:80';
  List<Trip> _trips = [];
  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/trips'));
      if (response.statusCode == 200) {
        _trips = (json.decode(response.body) as List)
            .map((tripJson) => Trip.fromJson(tripJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  Trip getById(String tripId) {
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}
