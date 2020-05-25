
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
  bool loading = false;
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
          Container(
            width: MediaQuery.of(context).size.width ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Get Fit",style: TextStyle(color: Colors.white,fontFamily:'Heatwood',fontSize: 40)),
                Text("Welcome to the family",style: TextStyle(color: Colors.white,fontFamily:'',fontSize: 20)),
                Text("Stay Fit Stay Awesome",style: TextStyle(color: Colors.white,fontFamily:'',fontSize: 15)),SizedBox(height:MediaQuery.of(context).size.height*0.4),
                Container(
                  margin: EdgeInsets.only(top:20),
                  padding: EdgeInsets.all(10),
                  height: 80,
                  width: MediaQuery.of(context).size.width-20,
                  child: RaisedButton.icon(
                    icon:Icon(Icons.email,size:30, color:Colors.white),
                    onPressed: (){Navigator.pushNamed(context,'signin');},
                    color: Colors.red,
                    label: Text("Sign up with Email",style:TextStyle(color:Colors.white),)
                  ),
                ),
                 Container(
                   height: 30,
                   child: FlatButton(
                    onPressed: ()async{
                      setState(() => loading = true);                  
                      dynamic result = await _auth.signInAnon();
                      if (result == null){
                        setState(() => loading = false);                  
                        print('error signing in');
                      }
                      else{
                        print('signed in');
                      }
                    },
                    child: Text('Sign in as a Guest',style: TextStyle(color:Colors.white),),
                ),
                 ),
              ],
            ),
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