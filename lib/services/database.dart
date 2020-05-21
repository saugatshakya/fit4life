import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  
  //collection reference
  final CollectionReference fitnessCollection = Firestore.instance.collection('fitness');

  Future updateUserData(List<String> exercises,int noOfExercises, int calories, int minutes)async {
    return await fitnessCollection.document(uid).setData({
      'exercises': exercises,
      'noOfExercise': noOfExercises,
      'calories': calories,
      'minutes': minutes
    });
  }
  Stream<QuerySnapshot> get fitness {
    return fitnessCollection.snapshots();
  }
}