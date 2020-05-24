import 'package:flutter/material.dart';
import 'package:loginapp/data/workout.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/shared/loading.dart';
import 'package:loginapp/widgets/card.dart';
import 'package:loginapp/widgets/mcard.dart';
import 'package:intl/intl.dart';
import 'package:loginapp/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final height = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder:(context,snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return Scaffold(
          backgroundColor: Colors.indigo[300],
          body: Stack(
      children:[
        Positioned(
          top:0,
          height:height * 0.25,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: const Radius.circular(40),
            ),
            child:Container(
              color:Colors.indigo,
              padding:EdgeInsets.only(top:30),
              child:Column(
                  children:[Text(
                  "${DateFormat("EEEE").format(today)},${DateFormat("d MMMM").format(today)}",style:TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w600)),
                  SizedBox(height:20),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Column(children:[Text(userData.noOfExercise.toString(),style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600)),SizedBox(height:5),Text("Workouts",style:TextStyle(color:Colors.white,fontSize: 26,fontWeight: FontWeight.w600))]),
                    Column(children:[Text(userData.calories.toString(),style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600)),SizedBox(height:5),Text("Calories",style:TextStyle(color:Colors.white,fontSize: 26,fontWeight: FontWeight.w600)),]),
                    Column(children:[Text(userData.minutes.toString(),style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600)),SizedBox(height:5),Text("Minutes",style:TextStyle(color:Colors.white,fontSize: 26,fontWeight: FontWeight.w600)),])
                  ]
                ),]
              )
            )
          )),
        Positioned(
          top: height*0.26,
          left:0,
          right:0,
          child: Container(
            height:height*0.545,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(padding: const EdgeInsets.only(bottom:5,left:32),child:Text("WorkOut Plans",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),),
              Expanded(child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children:[
                  SizedBox(width:32),
                  for (int i = 0; i< workouts.length; i++) WorkOutCard(workout: workouts[i])
                ]
              ),)),
              SizedBox(height:2),
              Expanded(child:Mcard()),
            ],)
          ),)
      ]
          )
          
        );
          }
          else{
            return Loading();
          }
          
          });
  }
}
