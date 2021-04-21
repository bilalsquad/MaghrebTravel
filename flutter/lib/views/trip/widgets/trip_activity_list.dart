import 'package:flutter/material.dart';
import 'package:mon_app/models/activity.model.dart';
import 'package:mon_app/models/trip.model.dart';
import 'package:mon_app/providers/trip_provider.dart';
import 'package:provider/provider.dart';

class TripActivityList extends StatelessWidget {
  final String tripId;
  final ActivityStatus filter;

  TripActivityList({this.tripId, this.filter});

  @override
  Widget build(BuildContext context) {
    final Trip trip = Provider.of<TripProvider>(context).getById(tripId);
    final List<Activity> activities =
        trip.activities.where((activity) => activity.status == filter).toList();
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) {
        Activity activity = activities[i];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: filter == ActivityStatus.ongoing
              ? Dismissible(
                  direction: DismissDirection.endToStart,
                  key: ValueKey(activity.id),
                  child: Card(
                    child: ListTile(
                      title: Text(activity.name),
                    ),
                  ),
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green[700],
                    ),
                  ),
                  confirmDismiss: (_) {
                    return Provider.of<TripProvider>(context, listen: false)
                        .updateTrip(trip, activity.id)
                        .then((_) => true)
                        .catchError((_) => false);
                  },
                )
              : Card(
                  child: ListTile(
                    title: Text(
                      activity.name,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
