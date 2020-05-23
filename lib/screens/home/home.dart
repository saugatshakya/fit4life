import 'package:flutter/material.dart';
import 'package:loginapp/modules/profile.dart';
import 'package:loginapp/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.indigo[300],
    appBar: AppBar(
      title:Text('Get Fit'),
      actions: <Widget>[
        FlatButton.icon(onPressed:()async{await _auth.signOut();}, icon:Icon(Icons.person, color: Colors.white, size: 30), label: Text('logout',style: TextStyle(color:Colors.white,fontSize: 16)))
      ],
    ),
    bottomNavigationBar: ClipRRect(
      borderRadius: BorderRadius.vertical(top:Radius.circular(40)),
        child: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          size: 30,
          color:Colors.white
        ),
        unselectedIconTheme: IconThemeData(
          size: 25,
          color:Colors.white60
        ),
        items:[
        BottomNavigationBarItem(
        backgroundColor: Colors.indigo,
          icon:Icon(
            Icons.calendar_today
          ),
          title:Text("Plan")
        ),
        BottomNavigationBarItem(
        backgroundColor: Colors.indigo,
          icon:Icon(
            Icons.fitness_center
          ),
          title:Text("Workouts")
        ),
        BottomNavigationBarItem(
        backgroundColor: Colors.indigo,
          icon:Icon(
            Icons.list
          ),
          title:Text("Exercise List")
        ),
        BottomNavigationBarItem(
        backgroundColor: Colors.indigo,
          icon:Icon(
            Icons.fastfood
          ),
          title:Text("Nutrition")
        ),
      ]),
    ),
    body: Profile(),
      );
  }
}