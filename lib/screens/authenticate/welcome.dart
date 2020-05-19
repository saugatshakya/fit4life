
import 'package:flutter/material.dart';
import 'package:loginapp/screens/authenticate/sign_in.dart';
import 'package:loginapp/screens/authenticate/sign_up.dart';
import 'package:loginapp/services/auth.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.indigo,Colors.red
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        ),
      ),
      child:Stack(
      children:[Opacity(
        opacity: 0.3,
          child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage('assets/welcome.jpg'),fit:BoxFit.fill)
          ),),),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(bottom:15),child:Text("Get Fit",style: TextStyle(color: Colors.white,fontFamily:'Heatwood',fontSize: 35))),
              Container(margin: EdgeInsets.only(bottom:10),child:Text("Welcome to the family",style: TextStyle(color: Colors.white,fontFamily:'',fontSize: 20))),
              Container(margin: EdgeInsets.only(bottom:200),child:Text("Stay Fit Stay Awesome",style: TextStyle(color: Colors.white,fontFamily:'',fontSize: 15))),
              Container(
                margin: EdgeInsets.fromLTRB(10,0,10,5),
                width: 500,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: FlatButton(
                  onPressed: navigateToSignUp,
                  child: Hero(tag:'signup',child: Text('Sign Up',style: TextStyle(color:Colors.white),)),
                ),
              ),
              Container(
                height: 30,
                child: FlatButton(
                  onPressed: navigateToSignIn,
                  child: Hero(tag:"signin",child: Text('I Already Have An Account',style: TextStyle(color:Colors.white))),
                ),
              ),
               Container(
                 height: 30,
                 padding: EdgeInsets.all(0),
                 margin: EdgeInsets.only(bottom:20),
                 child: FlatButton(
                  onPressed: ()async{
                    dynamic result = await _auth.signInAnon();
                    if (result == null){
                      print('error signing in');
                    }
                    else{
                      print('signed in');
                      print(result.uid);
                      print(result.caloriesBurnt);
                      print(result.minutes);
                      print(result.noOfExercise);
                    }
                  },
                  child: Text('Sign in as a Guest',style: TextStyle(color:Colors.white),),
              ),
               ),
            ],
          ),
      ]
      )
    ));
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}