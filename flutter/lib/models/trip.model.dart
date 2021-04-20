import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_app/models/activity.model.dart';

class Trip {
  String id;
  String city;
  List<Activity> activities;
  DateTime date;
  Trip({
    @required this.city,
    @required this.activities,
    @required this.date,
    @required this.id,
  });

  Trip.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        city = json['city'],
        date = DateTime.parse(json['date']),
        activities = (json['activities'] as List)
            .map((activitiyJson) => Activity.fromJson(activitiyJson))
            .toList();
}
