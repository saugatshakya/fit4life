import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  
  //collection reference
  final CollectionReference fitnessCollection = Firestore.instance.collection('fitness');

  Future updateUserData(int noOfExercises, int calories, int minutes)async {
    return await fitnessCollection.document(uid).setData({
      'noOfExercise': noOfExercises,
      'calories': calories,
      'minutes': minutes
    });
  }
  
  Stream<UserData> get userData {
    return fitnessCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      calories: snapshot.data['calories'],
      noOfExercise: snapshot.data['noOfExercise'],
      minutes: snapshot.data['minutes']
    );
  }
}