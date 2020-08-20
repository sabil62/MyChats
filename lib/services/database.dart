import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  updateUserName(userAndemail) async {
    await Firestore.instance.collection("users").add(userAndemail);
  }

  getUserName(String email) {
    return Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  getUserNamefromName(String username) {
    return Firestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .getDocuments();
  }
}
