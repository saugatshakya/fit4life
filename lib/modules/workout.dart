import 'package:flutter/material.dart';
import 'package:loginapp/data/workout.dart';
import 'package:loginapp/widgets/lcard.dart';

class WorkOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,0,10,0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            for(int i = 0;i<specialworkouts.length;i++)Lcard(workout:specialworkouts[i])
          ],
        ),
      ),
    );
  }
}