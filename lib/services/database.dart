import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  
  //collection reference
  final CollectionReference fitnessCollection = Firestore.instance.collection('fitness');
  final CollectionReference userDataCollection = Firestore.instance.collection('userData');

  Future updateUserData(int noOfExercises, int calories, int minutes)async {
    return await fitnessCollection.document(uid).setData({
      'noOfExercise': noOfExercises,
      'calories': calories,
      'minutes': minutes,
    });
  }

  Future updateFitnessData(int exInit,int ex, int caInit,int ca ,int miInit, int mi)async {
    return await fitnessCollection.document(uid).setData({
      'noOfExercise': exInit +  ex,
      'calories': caInit + ca,
      'minutes': miInit + mi
    });
  }

  Future changeUserData(String name, int age, int height, int weight,int stepstoday)async {
    return await userDataCollection.document(uid).setData({
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'stepstoday': stepstoday
    });
  }
  
  Stream<UserData> get fitnessData {
    return fitnessCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<UserData> get userData {
    return userDataCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      calories: snapshot.data['calories'],
      noOfExercise: snapshot.data['noOfExercise'],
      minutes: snapshot.data['minutes'],
      age: snapshot.data['age'],
      height: snapshot.data['height'],
      weight: snapshot.data['weight'],
      stepstoday: snapshot.data['stepstoday']
    );
  }
}