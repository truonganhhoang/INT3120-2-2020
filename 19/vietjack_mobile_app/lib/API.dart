import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Auth.dart';
class API{
  static Future<QuerySnapshot> getUser() async {// this will return a future then value will be a user contain email, id, name, class: value.docs[0][item]
    return await FirebaseFirestore.instance
        .collection("Users")
        .where("UserId", isEqualTo: auth.currentUser.uid)
        .get();
  }
}