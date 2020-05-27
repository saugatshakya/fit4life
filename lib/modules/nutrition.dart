import 'package:flutter/material.dart';
import 'package:loginapp/data/nutrition.dart';

class Nutrition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(children: <Widget>[
          SizedBox(height:10),
          Container(child: Text(nutrition.name,style: TextStyle(color:Colors.white,fontSize: 32,fontWeight:FontWeight.w700))),
          SizedBox(height:10),
          Container(margin: EdgeInsets.only(left:10,right:10),child: Text(nutrition.info,style: TextStyle(color:Colors.white,))),
          SizedBox(height:10),
          Expanded(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Column(
              children:[for(int i =0;i<nutrition.breakfast.length;i++)
              Container(width:MediaQuery.of(context).size.width,height:250,margin: EdgeInsets.only(top:5),child: 
              Column(children:[
                Text("Day "+(i+1).toString(),style: TextStyle(color:Colors.white,fontSize: 30,fontWeight:FontWeight.w500),),
                SizedBox(height:10),
                Expanded(
                  child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Row(children: <Widget>[
                    Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors:[Colors.green,Colors.green[900]])),padding: EdgeInsets.all(10),width:250,child:Column(children:[Text("Breakfast",style: TextStyle(color:Colors.white,fontSize:16),),Text(nutrition.breakfast[i].name,style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color:Colors.white)),Text("Calories: "+nutrition.breakfast[i].cal.toString(),style: TextStyle(color:Colors.white,fontSize: 12),),SizedBox(height:5),Text(nutrition.breakfast[i].recipe,style: TextStyle(color:Colors.white,fontSize: 14,letterSpacing:2),)])),SizedBox(width: 25),
                    Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors:[Colors.green,Colors.green[900]])),padding: EdgeInsets.all(10),width:250,child:Column(children:[Text("Lunch",style: TextStyle(color:Colors.white,fontSize:16),),Text(nutrition.lunch[i].name,style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color:Colors.white)),Text("Calories: "+nutrition.lunch[i].cal.toString(),style: TextStyle(color:Colors.white,fontSize: 12),),SizedBox(height:5),Text(nutrition.lunch[i].recipe,style: TextStyle(color:Colors.white,fontSize: 14,letterSpacing:2),)])),SizedBox(width: 25),
                    Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors:[Colors.green,Colors.green[900]])),padding: EdgeInsets.all(10),width:250,child:Column(children:[Text("Dinner",style: TextStyle(color:Colors.white,fontSize:16),),Text(nutrition.dinner[i].name,style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color:Colors.white)),Text("Calories: "+nutrition.dinner[i].cal.toString(),style: TextStyle(color:Colors.white,fontSize: 12),),SizedBox(height:5),Text(nutrition.dinner[i].recipe,style: TextStyle(color:Colors.white,fontSize: 14,letterSpacing:2),)]))
                  ],)
                )),
                SizedBox(height:20,)
              ])
              )
              ])
            ),
          )],),
      )
    );
  }
}