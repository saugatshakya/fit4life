import 'package:flutter/material.dart';
import 'package:loginapp/services/auth.dart';
import 'package:loginapp/shared/loading.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;
  String _email, _password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading():SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
          Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Container(margin: EdgeInsets.only(top:30,bottom:15),child:Text("Get Fit",style: TextStyle(color: Colors.white,fontFamily:'Heatwood',fontSize: 35))),
              Hero(tag:"signup",child:Text('Sign Up',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w500 ,fontSize:20))),
              Container(
                margin: EdgeInsets.only(top:20,left:10 ,right:10 ),
                height: 50,
                child: TextFormField(
                  validator: (input) {
                    if(input.isEmpty){
                      return 'Provide an email';
                    }
                    else return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                     labelStyle: TextStyle(color: Colors.white),
                       border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(
                          color: Colors.white
                          ),
                        ),
                  ),
                  onChanged: (input) => _email = input,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20,left:10 ,right:10 ),
                height: 50,
                child: TextFormField(
                  validator: (input) {
                    if(input.length < 6){
                      return 'Password needs to be Longer';
                    }
                    else return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                     labelStyle: TextStyle(color: Colors.white),
                       border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(
                          color: Colors.white
                          ),
                        ),
                  ),
                  onChanged: (input) => _password = input,
                  obscureText: true,
                ),
              ),
              Container(
                 margin: EdgeInsets.only(top:20),
                    width: 300,
                    height:40,
                    decoration: BoxDecoration(
                      color:Colors.red[800],
                      borderRadius: BorderRadius.circular(20)
                    ),
                child: FlatButton(
                  onPressed:() async {
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(_email, _password);
                      if(result == null){
                        setState((){ error = 'please supply a valid email'; loading = false;});
                      }
                      else{
                    Navigator.of(context).pushNamedAndRemoveUntil('check', (Route<dynamic> route) => false);
                    }
                    }
                  },
                  child: Text('Sign Up',style: TextStyle(color:Colors.white),),
                ),
              ),
              Container(height:10,child:Text(error,style: TextStyle(color:Colors.red,fontSize: 14))),
              Container(
                 margin: EdgeInsets.only(top:20),
                child: FlatButton(
                  onPressed:(){Navigator.pushNamed(context,'signin');},
                  child: Hero(tag:'signin',child: Text('I Already Have An Account',style: TextStyle(color:Colors.white,),
                ),
                  ),
              ),
              ),
              Container(
               height: 30,
               padding: EdgeInsets.all(0),
               margin: EdgeInsets.only(bottom:20),
               child: FlatButton(
                onPressed: ()async{
                  setState(() => loading = true);   
                  dynamic result = await _auth.signInAnon();
                  if (result == null){
                  setState((){ error = 'can\'t sign in'; loading = false;});
                  }
                  else{
                    Navigator.of(context).pushNamedAndRemoveUntil('check', (Route<dynamic> route) => false);
                  }
                },
                child: Text('Sign in as a Guest',style: TextStyle(color:Colors.white),),
            ),
             ),],
          )
            ),]
        ),
      ),
    ));
  }
}