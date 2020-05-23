import 'package:flutter/material.dart';
import 'package:loginapp/models/exercise.dart';

class Instruction extends StatelessWidget {
  final Exercise exercise;
  const Instruction({Key key, @required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instruction"),),
      body: Container(
        padding: EdgeInsets.fromLTRB(16,10,16,0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(exercise.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 10),
            Image.asset(exercise.videoPath),
            Text("Hints",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500),),
            SizedBox(height: 10),
            Text(exercise.hint,style: TextStyle(fontSize: 16),),
            SizedBox(height: 10),
            Text("Breathing",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500),),
            SizedBox(height: 10),
            Text(exercise.breathing,style: TextStyle(fontSize:16),)      
          ],
        ),
      ),
      
    );
  }
}