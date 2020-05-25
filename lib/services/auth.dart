import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null; 
  }
  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
  // sign in anom
  Future signInAnon() async {
    try {
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        //create a new document for the user with uid
        await DatabaseService(uid: user.uid).updateUserData(0, 0, 0);
        await DatabaseService(uid: user.uid).changeUserData("",0,0,0);
        return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with google
  Future signInGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email'
        ],
        hostedDomain: "",
        clientId: "",
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      await DatabaseService(uid: user.uid).updateUserData(0, 0, 0);
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.message);
    }
  }
  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(0, 0, 0);
      await DatabaseService(uid: user.uid).changeUserData("",0,0,0);
      return _userFromFirebaseUser(user);      
    }
    catch(e)
    {
      print(e.toString());
      return null;

    }
  }
    // signin with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);      
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
