import 'package:flutter/material.dart';
import 'package:mon_app/models/activity.model.dart';
import './trip_activity_list.dart';

class TripActivities extends StatelessWidget {
  final String tripId;
  TripActivities({this.tripId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                child: TabBar(
                  tabs: [
                    Tab(
                      text: 'En cours',
                    ),
                    Tab(
                      text: 'Terminé',
                    )
                  ],
                ),
                color: Theme.of(context).primaryColor,
              ),
              Container(
                height: 600,
                child: TabBarView(
                  children: [
                    TripActivityList(
                      tripId: tripId,
                      filter: ActivityStatus.ongoing,
                    ),
                    TripActivityList(
                      tripId: tripId,
                      filter: ActivityStatus.done,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
