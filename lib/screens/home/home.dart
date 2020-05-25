import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/modules/profile.dart';
import 'package:loginapp/services/auth.dart';
import 'package:loginapp/services/database.dart';
import 'package:loginapp/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    String _name;
    int _age, _weight, _height;
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context,snapshot){
      if(snapshot.hasData)
      {
      UserData userData = snapshot.data;
      if(userData.name != "")
      {
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
        );}
      else
      {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: 
              [
                Colors.indigo,
                Colors.red
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              )
            ),
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Container(
                width: MediaQuery.of(context).size.width-120,
                child: TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Name';
                  }
                  else return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color:Colors.white),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20),
                      borderSide: new BorderSide(
                      color: Colors.white
                      ),
                    ),
                  ),                    
                onChanged: (input) => _name = input,
                ),
              ),
              SizedBox(height:15),
              Container(
                width: MediaQuery.of(context).size.width-120,
                child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Age';
                  }
                  else return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color:Colors.white),
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20),
                      borderSide: new BorderSide(
                      color: Colors.white
                      ),
                    ),
                  ),                    
                onChanged: (input) => _age = num.tryParse(input),
                ),
              ),SizedBox(height:15),
              Container(
                width: MediaQuery.of(context).size.width-120,
                child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal:true),
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Height';
                  }
                  else return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color:Colors.white),
                  labelText: 'Height',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20),
                      borderSide: new BorderSide(
                      color: Colors.white
                      ),
                    ),
                  ),                    
                onChanged: (input) => _height = num.tryParse(input),
                ),
              ),SizedBox(height:15),
              Container(
                width: MediaQuery.of(context).size.width-120,
                child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal:true),
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Weight';
                  }
                  else return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color:Colors.white),
                  labelText: 'Weight',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20),
                      borderSide: new BorderSide(
                      color: Colors.white
                      ),
                    ),
                  ),                    
                onChanged: (input) => _weight = num.tryParse(input),
                ),
              ),SizedBox(height:15),
              RaisedButton(onPressed: ()async{
                if(_formKey.currentState.validate()){
                  await DatabaseService(uid: user.uid).changeUserData(_name, _age, _height, _weight);
                }
              },child: Text("Proceed"),)
              ]
              ),
            ),
          )
        );
      }
      }
      else
      return Loading();
      });
  }
}