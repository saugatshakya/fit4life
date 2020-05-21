import 'package:flutter/material.dart';
import 'package:loginapp/data/workout.dart';
import 'package:loginapp/widgets/card.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      body: Stack(
        children:[
          Positioned(
            top:0,
            height:height * 0.30,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child:Container(
                color:Colors.indigo
              )
            )),
          Positioned(
            top: height*0.32,
            left:0,
            right:0,
            child: Container(
              height:height*0.62,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Padding(padding: const EdgeInsets.only(bottom:8,left:32),child:Text("WorkOut Plans",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),),
                Expanded(child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                  children:[
                    SizedBox(width:32),
                    for (int i = 0; i< workouts.length; i++) WorkOutCard(workout: workouts[i])
                  ]
                ),)),
                SizedBox(height: 10),
                Expanded(child:Container(color: Colors.blue,)),
              ],)
            ),)
        ]
      )
      
    );
  }
}
