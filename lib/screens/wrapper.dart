import 'package:flutter/material.dart';
import 'package:loginapp/screens/authenticate/welcome.dart';
import 'package:loginapp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    
    //check if user signed in or not
    if (user == null){
      return WelcomePage();
    } else {
      return Home();
    }
  }
}