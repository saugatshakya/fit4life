import 'package:flutter/material.dart';
import 'package:loginapp/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Get Fit'),
        actions: <Widget>[
          FlatButton.icon(onPressed:()async{await _auth.signOut();}, icon:Icon(Icons.person), label: Text('logout'))
        ],
      ),
    );
  }
}