import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';
import 'package:steps_indicator/steps_indicator.dart';

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
            Flexible(fit: FlexFit.tight,child: ClipRRect(borderRadius: BorderRadius.vertical(top:Radius.circular(20)),child: Image.asset(workout.imagePath,width:150,fit: BoxFit.fill))),
            Text(workout.time,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
            Flexible(fit: FlexFit.tight,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(workout.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Row(children: [Text('Cardio: '),StepsIndicator(nbSteps: workout.cardio,lineLength:10,unselectedStepColor: Colors.blue,lineThickness:3,selectedStepColorIn: Colors.blue,selectedStepSize: 10,)]),
              Row(children:[Text('Strength: '),StepsIndicator(nbSteps: workout.strength,lineLength:10,unselectedStepColor: Colors.blue,lineThickness:3,selectedStepColorIn: Colors.blue,selectedStepSize: 10,)]),
              SizedBox(height: 16),
            ]
              ))
          ]
        ),
      ),
      
    );
  }
}