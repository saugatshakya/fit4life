import 'package:flutter/material.dart';
import 'package:loginapp/screens/authenticate/sign_in.dart';
import 'package:loginapp/screens/authenticate/sign_up.dart';
import 'package:loginapp/screens/home/home.dart';
import 'package:loginapp/screens/wrapper.dart';
import 'package:loginapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          routes: {
            'signup': (context) => SignUpPage(),
            'signin': (context) => LoginPage(),
            'home': (context) => Home(),
            'check': (context) => Wrapper()
          },
        title: 'Get Fit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Wrapper(),
      ),
    );
  }
}