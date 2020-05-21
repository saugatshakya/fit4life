import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';

class WorkOutCard extends StatelessWidget {
  final WorkOut workout;
  const WorkOutCard({Key key, @required this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:20, bottom:10),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children:[
            Flexible(fit: FlexFit.tight,child: ClipRRect(borderRadius: BorderRadius.vertical(top:Radius.circular(20)),child: Image.asset(workout.imagePath,width: 160,fit: BoxFit.cover,))),
            Flexible(fit: FlexFit.tight,child: Column(
              children:[
                Text(workout.time),
                Text(workout.name),
                Text(workout.cardio.toString()),
                Text(workout.strength.toString()),
                SizedBox(height: 16),
              ]
            ))
          ]
        ),
      ),
      
    );
  }
}