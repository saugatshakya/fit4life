import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginapp/services/database.dart';
import 'package:loginapp/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';
import 'package:pedometer/pedometer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  int  _stepCountValue = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(int stepCountValue) {
    print(stepCountValue);
  }

  void startListening() {
    _pedometer = new Pedometer();
    _subscription = _pedometer.pedometerStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void stopListening() {
    _subscription.cancel();
  }

  void _onData(int newValue) async {
    print('New step count value: $newValue');
    setState((){ _stepCountValue = num.tryParse("$newValue");});
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");
  bool edit = false;
  int weight, height;
  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width-40;
  final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder:(context,snapshot){
        if(snapshot.hasData)
        {
          UserData userData = snapshot.data;
          final double bmi = userData.weight*10000/(userData.height*userData.height);
          return Column(
            children: [Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),gradient: LinearGradient(colors:[Colors.red,Colors.red[900]])),
            height: MediaQuery.of(context).size.height*0.26,
            padding: EdgeInsets.only(top:20),
            width:MediaQuery.of(context).size.width,
            child:Form(
            key: _form,
            child: Column(
            children: <Widget>[
            CircleAvatar(backgroundColor: Colors.white,child:Icon(Icons.person,size: 40,color:Colors.red[900]),minRadius:30,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children:[SizedBox(width:30),Text(userData.name,style: TextStyle(fontSize: 30,color:Colors.white,decoration:TextDecoration.none)),edit==false?IconButton(icon: Icon(Icons.edit,color: Colors.white), onPressed:(){setState(() {edit= true; print(edit);});}):IconButton(icon: Icon(Icons.save,color:Colors.white), onPressed:(){setState(()async{edit = false;print(edit);if(_form.currentState.validate()){await DatabaseService(uid: user.uid).changeUserData(userData.name,userData.age, height, weight,userData.stepstoday);}});})]),
            SizedBox(height:10),
            Row(mainAxisAlignment: MainAxisAlignment.center,children:[
            Text("Age: "+userData.age.toString(),style: TextStyle(fontSize: 18,color:Colors.white,decoration:TextDecoration.none)),
            SizedBox(width:10),
            edit==false?Text("Height: "+userData.height.toString(),style: TextStyle(fontSize: 18,color:Colors.white,decoration:TextDecoration.none)):Container(width: 80,child: TextFormField(keyboardType: TextInputType.numberWithOptions(decimal:true),
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
                  onChanged: (input) => height = num.tryParse(input),)),
            SizedBox(width:10),
            edit==false?Text("Weight: "+userData.weight.toString(),style: TextStyle(fontSize: 18,color:Colors.white,decoration:TextDecoration.none)):Container(width: 80,child: TextFormField(keyboardType: TextInputType.numberWithOptions(decimal:true),
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
                  onChanged: (input) => weight = num.tryParse(input),)),
            ])],
        ),
              )    
      ),
      Container(
        margin: EdgeInsets.only(top:20),
        padding: EdgeInsets.only(top:5),
        height: 90,
        width: MediaQuery.of(context).size.width-10,
        decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.red,Colors.red[900]]),borderRadius:BorderRadius.circular(20)),
            child:Column(children:[
            Text("Body Mass Index(BMI): "+bmi.toStringAsFixed(2),style: TextStyle(color:Colors.white),),
            SizedBox(height:10),
            Stack(children:[Container(height:30,width:width,decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.red[900],Colors.red[800],Colors.red,Colors.yellow,Colors.yellow[300],Colors.green[600],Colors.green[700],Colors.green[800],Colors.green[700],Colors.yellow,Colors.yellow[400],Colors.yellow[400],Colors.red[500],Colors.red[600],Colors.red[700],Colors.red[800],Colors.red[900]])),), Container(margin: EdgeInsets.only(left:(bmi*7)-20),color: Colors.black,width:2,height: 30,)]),
            SizedBox(height:5),
            Row(children:[Container(margin:EdgeInsets.only(left:width*0.1),child: Text("UnderWeight",style: TextStyle(fontSize: 12),)), Container(margin: EdgeInsets.only(left:width*0.1),child: Text("Normal",style: TextStyle(fontSize: 12),)), Container(margin: EdgeInsets.only(left:width*0.1),child: Text("OverWeight",style: TextStyle(fontSize: 12),)),Container(margin: EdgeInsets.only(left:width*0.1),child: Text("Obesity",style: TextStyle(fontSize: 12),))])
            ])),
            SizedBox(height:5),
            Icon(
                Icons.directions_walk,
                color:Colors.white,
                size: 30,
              ),
              Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30,color:Colors.white,),
              ),
              Text((_stepCountValue-userData.stepstoday).toString(),
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              RaisedButton(color: Colors.red,onPressed:()async{await DatabaseService(uid: user.uid).changeUserData(userData.name,userData.age,userData.height,userData.weight,_stepCountValue);},child:Text("Reset",style:TextStyle(color:Colors.white)))
            ]);
        }
        else
        return Loading();
        }
        );
  }
}