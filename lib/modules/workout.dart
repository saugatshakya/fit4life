import 'package:flutter/material.dart';
import 'package:loginapp/data/workout.dart';
import 'package:loginapp/widgets/lcard.dart';

class WorkOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.red[300],
      padding: EdgeInsets.fromLTRB(5,0,5,0),
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