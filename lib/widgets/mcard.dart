import 'package:flutter/material.dart';

class Mcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
      child: Row(
      children: [Container(
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
          Text("Upper Body",style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600)),
          Text("6 weeks",style:TextStyle(color:Colors.white38,fontSize: 16)),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
          Text('Cardio: ',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          Text('3',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          SizedBox(width:15),
          Text('Strength: ',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          Text('2',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          ]),
          Row(children:[
            Container(),
            Container()
          ])
        ],
      )
    ),

    Container(
      height: MediaQuery.of(context).size.height*0.25,
      margin: EdgeInsets.only(bottom:10,right:32),
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
          Text("Lower Body",style:TextStyle(color:Colors.white,fontSize: 32,fontWeight: FontWeight.w600)),
          Text("6 weeks",style:TextStyle(color:Colors.white38,fontSize: 16)),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
          Text('Cardio: ',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          Text('3',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          SizedBox(width:15),
          Text('Strength: ',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          Text('2',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
          ]),
          Row(children:[
            Container(),
            Container()
          ])
        ],
      )
    ),

    
      ]
    ),
        );




  }
}