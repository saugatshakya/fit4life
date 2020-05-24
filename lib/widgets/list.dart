import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';
import 'package:loginapp/widgets/instruction.dart';
import 'package:loginapp/widgets/startworkout.dart';

class List extends StatelessWidget {
  final WorkOut workout;
  const List({Key key, @required this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar:Container(
                    height: 60,
                    child:RaisedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Start(workout: this.workout)));},child: Text("Start WorkOut"),)
                  ),
          body: Container(
        width: width,
        padding: EdgeInsets.only(top:20),
        child:Column(children: <Widget>[
          Container(
            color:Colors.indigo,
          width: width,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(height:35,child: IconButton(icon: Icon(Icons.arrow_back,size: 30,color: Colors.white), onPressed:(){Navigator.pop(context);})),
              Container(padding:EdgeInsets.only(left:width*0.45),child: Text("Reps",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Column(children: <Widget>[Container(padding: EdgeInsets.all(15),width: 50,height: 50,decoration: BoxDecoration(color:Colors.indigo[300],borderRadius:BorderRadius.all(Radius.circular(30))),child: Text(workout.exercises.toString(),style: TextStyle(fontSize: 16,color:Colors.white),)),SizedBox(height:10),Text("Exercises",style: TextStyle(fontSize: 17,color: Colors.white),)]),SizedBox(width: 40),
                Column(children: <Widget>[Container(padding: EdgeInsets.all(15),width: 50,height: 50,decoration: BoxDecoration(color:Colors.indigo[300],borderRadius:BorderRadius.all(Radius.circular(30))),child: Text(workout.calories.toString(),style: TextStyle(fontSize: 16,color:Colors.white),)),SizedBox(height:10),Text("Calories",style: TextStyle(fontSize: 17,color: Colors.white),)]),SizedBox(width: 40),
                 Column(children: <Widget>[Container(padding: EdgeInsets.all(15),width: 50,height: 50,decoration: BoxDecoration(color:Colors.indigo[300],borderRadius:BorderRadius.all(Radius.circular(30))),child: Text(workout.minutes.toString(),style: TextStyle(fontSize: 16,color:Colors.white),)),SizedBox(height:10),Text("Minutes",style: TextStyle(fontSize: 17,color: Colors.white),)])
              ],),
              SizedBox(height: 30)
          ])),
                Expanded(
                  child:Container(
                  color: Colors.indigo[900],
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                  child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                  children:[
                    for (int i = 0; i< workout.exercise.length; i++)GestureDetector(onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Instruction(exercise: this.workout.exercise[i])));},child: Container(color: Colors.indigo[400],height: 70,padding: EdgeInsets.fromLTRB(10,5,5,5),child:Row(children:[Container(child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(5)),child: Image.asset(workout.exercise[i].imagePath,fit: BoxFit.fill))),SizedBox(width:10),Container(width: MediaQuery.of(context).size.width*0.53,child: Text(workout.exercise[i].name,style:TextStyle(fontSize:16,color:Colors.white ))),Text(workout.exercise[i].reps,style:TextStyle(fontSize:16,color:Colors.white)),Text(" reps",style:TextStyle(fontSize:16,color: Colors.white))])))
                  ]
                ),),
                    )),            
        ],)
      ),
    );
  }
}