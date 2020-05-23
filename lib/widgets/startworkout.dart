import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';

class Start extends StatelessWidget {
  final WorkOut workout;
  const Start({Key key, @required this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                  for (int i = 0; i< workout.exercise.length; i++)Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),margin: EdgeInsets.all(10),padding: EdgeInsets.fromLTRB(10,30,10,10),height:height-180,width: width-20,child:Column(crossAxisAlignment: CrossAxisAlignment.center,children:[Text(workout.exercise[i].name,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500),),SizedBox(height: 10),Text((i+1).toString()+"  of  "+workout.exercise.length.toString()),SizedBox(height: 10),Image.asset(workout.exercise[i].videoPath),SizedBox(height: 20),Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[Container(width: 70,height: 70,padding: EdgeInsets.fromLTRB(12,18,10,10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.blue),child: Text(workout.exercise[i].reps+"x",style: TextStyle(fontSize: 26,color: Colors.white),),),Container(width:70,height:70,decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.blue),child:IconButton(icon: Icon(Icons.play_arrow,size: 45,color: Colors.white,),onPressed: (){i++;},))],)])
                  )]
              ),)),
      ],),
      
    );
  }
}