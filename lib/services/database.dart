import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  updateUserName(userAndemail) async {
    await Firestore.instance.collection("users").add(userAndemail);
  }

  getUserName(String username) {
    return Firestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .getDocuments();
  }
}
