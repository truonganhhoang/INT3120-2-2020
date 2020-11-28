import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Auth.dart';
class API{
  static Future<QuerySnapshot> getUser() async {// this will return a future promise info of a user include email, id, name, class: value.docs[0][item]
    return await FirebaseFirestore.instance
        .collection("Users")
        .where("UserId", isEqualTo: auth.currentUser.uid)
        .get();
  }
  static Future<QuerySnapshot> getListContent(String grade, String nameSubject) async{
    return await FirebaseFirestore.instance
        .collection("Class_Subject")
        .doc(grade)
        .collection("Info")
        .doc(nameSubject)
        .collection("Content")
        .get();
  }

  static Future<void> addHistory(String userId, String grade, String nameSubject, String titleContent, DateTime createAt) async{
    return await FirebaseFirestore.instance.collection("History").add({
      "userId": userId,
      "grade": grade,
      "nameSubject":nameSubject,
      "titleContent":titleContent,
      "createAt": createAt
    });
  }
  static Future<QuerySnapshot> getHistory(String userId) async{
    return await FirebaseFirestore.instance.collection("History")
        //.orderBy("createAt",descending: true)
    .where("userId",isEqualTo: userId).get();
  }

}