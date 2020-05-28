import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/modules/nutrition.dart';
import 'package:loginapp/modules/profile.dart';
import 'package:loginapp/modules/profilefull.dart';
import 'package:loginapp/modules/workout.dart';
import 'package:loginapp/services/auth.dart';
import 'package:loginapp/services/database.dart';
import 'package:loginapp/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _currentIndex = 0;

  final tabs = [
    Profile(),
    WorkOut(),
    Nutrition(),
    FullProfile(),
  ];

  final List<Color>color = [
    Colors.indigo[800],
    Colors.orange[800],
    Colors.green[800],
    Colors.red[800],  
  ];

  final List<Color>backgroundcolor = [
    Colors.indigo,
    Colors.orange,
    Colors.green,
    Colors.red,
  ];

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
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: 
            [
              backgroundcolor[_currentIndex],
              color[_currentIndex]
            ])
          ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: color[_currentIndex],
          title:Text('Get Fit',style: TextStyle(fontFamily: 'Heatwood',fontSize: 18,height: 6),),
          actions: <Widget>[
            FlatButton.icon(onPressed:()async{await _auth.signOut();}, icon:Icon(Icons.person, color: Colors.white, size: 30), label: Text('logout',style: TextStyle(color:Colors.white,fontSize: 16,fontFamily:'Dalgona')))
          ],
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
            child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            onTap: (index){setState(() {_currentIndex = index; });},
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
            backgroundColor: Colors.indigo[800],
              icon:Icon(
                Icons.calendar_today
              ),
              title:Text("Plan")
            ),
            BottomNavigationBarItem(
            backgroundColor: Colors.orange[800],
              icon:Icon(
                Icons.fitness_center
              ),
              title:Text("Workouts")
            ),
            BottomNavigationBarItem(
            backgroundColor: Colors.green[800],
              icon:Icon(
                Icons.fastfood
              ),
              title:Text("Nutrition")
            ),
            BottomNavigationBarItem(
            backgroundColor: Colors.red[800],
              icon:Icon(
                Icons.person_outline
              ),
              title:Text("Profile")
            ),
          ]),
      ),
      body: tabs[_currentIndex],
          ),
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
                  await DatabaseService(uid: user.uid).changeUserData(_name, _age, _height, _weight,userData.stepstoday);
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