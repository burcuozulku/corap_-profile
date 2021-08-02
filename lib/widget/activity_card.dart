import 'package:flutter/material.dart';
import 'activity.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  int selectedActivity = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: 100.0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedActivity =
                  (selectedActivity == -1) ? widget.activity.id : -1;
            });
          },
          child: Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey, width: 1),
                color: selectedActivity == widget.activity.id
                    ? Color(0xffB6BFFF)
                    : Colors.transparent),
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                ),
                Text(
                  widget.activity.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selectedActivity == widget.activity.id
                        ? Colors.black
                        : Color(0xff32127A),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
