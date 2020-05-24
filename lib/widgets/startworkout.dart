import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';
import 'package:loginapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';

class Start extends StatelessWidget {
  final WorkOut workout;
  const Start({Key key, @required this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); 
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).userData,
      builder:(context,snapshot){
      UserData userData = snapshot.data;
      final nOofExercise = userData.noOfExercise;
      final calories = userData.calories;
      final minutes = userData.minutes;
      return Scaffold(
        backgroundColor: Colors.indigo[900],      
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Reps"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
                Expanded(
                  child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                  children:[
                    for (int i = 0; i< workout.exercise.length; i++)Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),margin: EdgeInsets.all(10),padding: EdgeInsets.fromLTRB(10,30,10,10),height:height-180,width: width-20,child:Column(crossAxisAlignment: CrossAxisAlignment.center,children:[Text(workout.exercise[i].name,style: TextStyle(fontSize:25,fontWeight: FontWeight.w500),),SizedBox(height: 15),Text((i+1).toString()+"  of  "+workout.exercise.length.toString()),SizedBox(height: 10),Container(width:190,child: Image.asset(workout.exercise[i].videoPath,fit: BoxFit.fill,)),SizedBox(height: 40),Container(width: 70,height: 70,padding: EdgeInsets.fromLTRB(12,18,10,10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.indigo),child: Text(workout.exercise[i].reps+"x",style: TextStyle(fontSize: 26,color: Colors.white),),),SizedBox(height: 10),i+1==workout.exercise.length?RaisedButton(color: Colors.indigo ,onPressed:() async { Navigator.pop(context); await DatabaseService(uid: user.uid).updateFitnessData(userData.noOfExercise, workout.exercises, userData.calories, workout.calories, userData.minutes, workout.minutes);},child: Text("End",style: TextStyle(color:Colors.white),)):SizedBox(height:0) ])
                    )]
                ),)),
        ],)
        
      );
      });
  }
}