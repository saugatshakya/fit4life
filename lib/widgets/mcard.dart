import 'package:flutter/material.dart';
import 'package:loginapp/data/workout.dart';
import 'package:loginapp/models/workout.dart';
import 'package:loginapp/widgets/list.dart';

class Mcard extends StatelessWidget {
  final WorkOut workout;
  const Mcard({Key key, @required this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> List(workout: this.workout)));print(workout.name);},
      child: Container(
      height: MediaQuery.of(context).size.height*0.25,
      margin: EdgeInsets.only(bottom:10,left:32,right:16),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(colors: 
        [
         Colors.indigo[900],
         Colors.indigo[700],
        ],
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
        )
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(workout.name,style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600)),
          Text(workout.time,style:TextStyle(color:Colors.white38,fontSize: 16)),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
          Text('Cardio: ',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          Text(workout.cardio.toString(),style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          SizedBox(width:15),
          Text('Strength: ',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          Text(workout.strength.toString(),style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          ]),
          Row(children:[
            Container(),
            Container()
          ])
        ],
      )
    ),
    );




  }
}