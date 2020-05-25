import 'package:flutter/material.dart';
import 'package:loginapp/data/exercise.dart';
import 'package:loginapp/models/exercise.dart';
import 'package:loginapp/widgets/instruction.dart';

class ExerciseList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {
    List<Exercise> filtered;
    bool isSearching = false;
    if(isSearching ==false){
      filtered = All;
    }
    void _filterexercise(value){
      List<Exercise> filtered = [];
      for(int i=0;i<All.length;i++){if(All[i].name.contains(value)){setState(() { filtered.add(All[i]);});}};
    }
    return Container(
      child:Column(
          children:[Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderSide:BorderSide.none)
            ),
            onChanged:(input){setState(() {isSearching = true; _filterexercise(input);});},
            ),
          ),
          Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                    children:[
                      for (int i = 0; i< filtered.length; i++)GestureDetector(onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Instruction(exercise:filtered[i])));},child: Container(color: Colors.indigo[400],height: 70,padding: EdgeInsets.fromLTRB(10,5,5,5),child:Row(children:[Container(child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(5)),child: Image.asset(filtered[i].imagePath,fit: BoxFit.fill))),SizedBox(width:10),Container(width: MediaQuery.of(context).size.width*0.50,child: Text(filtered[i].name,style:TextStyle(fontSize:14,color:Colors.white ))),Text(filtered[i].reps,style:TextStyle(fontSize:16,color:Colors.white)),Text(" reps",style:TextStyle(fontSize:16,color: Colors.white))])))
                    ]
                  ),),
          ),
          ])      
    );
  }
}