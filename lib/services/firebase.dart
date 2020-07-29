import 'package:firebase_auth/firebase_auth.dart';
import 'package:MyChat/model/user.dart';

//this is a function with Objects hai
User userFromFireBase(FirebaseUser userss) {
  return userss != null ? User(userId: userss.uid) : null;
}

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithFirebasess(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser userfirebase = result.user;
      return userFromFireBase(userfirebase);
    } catch (e) {
      print(e.toString());
    }
  }

  Future singUpWithFirebasess(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser userfirebase = result.user;
      return userFromFireBase(userfirebase);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth
          .signOut(); //OR  return FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
