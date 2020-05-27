import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';
import 'package:loginapp/widgets/list.dart';

class Lcard extends StatelessWidget {
  final WorkOut workout;
  const Lcard({Key key, @required this.workout}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> List(workout: this.workout)));},
        child: Container(
        decoration:BoxDecoration(gradient: LinearGradient(colors:[Colors.orange[800],Colors.orange[400]]),borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.fromLTRB(10,10,10,0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(height:150,width:180,child: ClipRRect(borderRadius: BorderRadius.horizontal(left:Radius.circular(20)),child: Image.asset(workout.imagePath,fit: BoxFit.cover))),
            SizedBox(width:10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Text(workout.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(workout.time,style: TextStyle(fontSize: 12),),
              Row(children:[Text("Strength:"+workout.strength.toString()),SizedBox(width:20),Text("Cardio: "+workout.cardio.toString())])
            ]),
          ],
        )
      ),
    );
  }
}