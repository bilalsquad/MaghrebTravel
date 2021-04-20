import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:flutter/widgets.dart';
import 'package:mon_app/models/activity.model.dart';
import 'package:mon_app/models/trip.model.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = [];
  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

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
