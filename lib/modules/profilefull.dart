import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginapp/services/database.dart';
import 'package:loginapp/shared/loading.dart';
import 'package:loginapp/widgets/profile.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';

class FullProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final today = DateTime.now();
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).fitnessData,
      builder:(context,snapshot){
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: 
              [
                Colors.red,
                Colors.red[800]
              ],
              )
            ),
            child: SafeArea(
                child: Stack(
                children:[
                Positioned(
                  top:MediaQuery.of(context).size.height*0.001,
                  child: Profile()
                ),
                Positioned(
                  bottom:MediaQuery.of(context).size.height*0.001,
                        child: GestureDetector(
                          onTap:(){Navigator.popAndPushNamed(context,'home');},
                          child: Hero(
                            tag: "profile",
                            child: Container(
                            height: MediaQuery.of(context).size.height*0.22,
                            width: MediaQuery.of(context).size.width,
                            decoration:BoxDecoration(gradient:LinearGradient(colors:[Colors.red,Colors.red[900]]),borderRadius: BorderRadius.vertical(top:Radius.circular(40))),
                            child:Column(
                              mainAxisSize: MainAxisSize.min,
                                children:[
                                Container(height:30,child: IconButton(icon:Icon(Icons.keyboard_arrow_up,color: Colors.white), onPressed:(){Navigator.popAndPushNamed(context,'home');})),
                                Text("${DateFormat("EEEE").format(today)},${DateFormat("d MMMM").format(today)}",style:TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),
                                SizedBox(height:20),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Column(children:[Text(userData.noOfExercise.toString(),style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),SizedBox(height:5),Text("Workouts",style:TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.w600,decoration: TextDecoration.none))]),
                                  Column(children:[Text(userData.calories.toString(),style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),SizedBox(height:5),Text("Calories",style:TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),]),
                                  Column(children:[Text(userData.minutes.toString(),style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),SizedBox(height:5),Text("Minutes",style:TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),])
                                ]
                              ),
                      ]
                            )
                      ),
                          ),
                        ),
                )
                ]),
            ),
      ),
          );
        }
        else{
          return Loading();
        }});
  }
}