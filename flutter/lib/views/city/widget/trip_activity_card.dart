import 'package:flutter/material.dart';
import 'package:mon_app/models/activity.model.dart';
import '../../../models/activity.model.dart';

class Tripactivitycard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  Tripactivitycard({Key key, this.activity, this.deleteTripActivity})
      : super(key: key);

  @override
  _TripactivitycardState createState() => _TripactivitycardState();
}

class _TripactivitycardState extends State<Tripactivitycard> {
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(widget.activity.name,
            style: TextStyle(
              color: color,
            )),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            widget.deleteTripActivity(widget.activity.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Activité supprimé"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "Annuler",
                  textColor: Colors.white,
                  onPressed: () {
                    print("undo");
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
