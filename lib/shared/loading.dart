import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          Colors.indigo,
          Colors.red
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        ),
        image:DecorationImage(image: AssetImage('assets/welcome.jpg'),fit:BoxFit.fill)
      ),
        child:Center(
        child:SpinKitChasingDots(
          color:Colors.red,
          size:50
        )
      )
    );
  }
}