import 'package:flutter/material.dart';
import 'package:loginapp/models/workout.dart';
import 'package:loginapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/user.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Start extends StatefulWidget {
  final WorkOut workout;
  const Start({Key key, @required this.workout}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    onChange: (value) => print('onChange $value'),
  );


  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) => print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); 
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).fitnessData,
      builder:(context,snapshot){
      UserData userData = snapshot.data;
      return Scaffold(
        backgroundColor: Colors.indigo[900],      
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Reps",style: TextStyle(fontFamily: 'Heatwood',height:5),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
                Expanded(
                  child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                  children:[
                    for (int i = 0; i< widget.workout.exercise.length; i++)Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),margin: EdgeInsets.all(10),padding: EdgeInsets.fromLTRB(10,30,10,10),height:height-160,width: width-20,child:Column(crossAxisAlignment: CrossAxisAlignment.center,children:[Text(widget.workout.exercise[i].name,style: TextStyle(fontSize:25,fontWeight: FontWeight.w500),),SizedBox(height: 15),Text((i+1).toString()+"  of  "+widget.workout.exercise.length.toString()),SizedBox(height: 10),Container(width:190,child: Image.asset(widget.workout.exercise[i].videoPath,fit: BoxFit.fill,)), Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data;
                    final displayTime = StopWatchTimer.getDisplayTime(value);
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            displayTime,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[RaisedButton(
                              padding: const EdgeInsets.all(4),
                              color: Colors.lightBlue,
                              shape: const StadiumBorder(),
                              onPressed: () async {
                                _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                              },
                              child: Text('Start', style: TextStyle(color: Colors.white))),RaisedButton(
                              padding: const EdgeInsets.all(4),
                              color: Colors.green,
                              shape: const StadiumBorder(),
                              onPressed: () async {
                                _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                              },
                              child: Text('Stop', style: TextStyle(color: Colors.white),),
                            ),RaisedButton(
                              padding: const EdgeInsets.all(4),
                              color: Colors.red,
                              shape: const StadiumBorder(),
                              onPressed: () async {
                                _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                              },
                              child: Text('Reset', style: TextStyle(color: Colors.white),),
                            ),],),Container(width: 70,height: 70,padding: EdgeInsets.fromLTRB(12,18,10,10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.indigo),child: Text(widget.workout.exercise[i].reps+"x",style: TextStyle(fontSize: 26,color: Colors.white),),),SizedBox(height: 10),i+1==widget.workout.exercise.length?RaisedButton(color: Colors.indigo ,onPressed:() async { Navigator.pop(context); await DatabaseService(uid: user.uid).updateFitnessData(userData.noOfExercise, widget.workout.exercises, userData.calories, widget.workout.calories, userData.minutes, _stopWatchTimer.minuteTime.value);},child: Text("End",style: TextStyle(color:Colors.white),)):SizedBox(height:0) ])
                    )],
                ),)),
        ],)
        
      );
      });
  }
}