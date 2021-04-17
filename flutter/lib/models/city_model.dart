import 'package:flutter/foundation.dart';

import './activity.model.dart';

class City {
  String image;
  String name;
  List<Activity> activities;
  City({
    @required this.image,
    @required this.name,
    @required this.activities,
  });
}
