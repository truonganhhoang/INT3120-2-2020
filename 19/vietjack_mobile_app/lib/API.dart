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

  static Future<void> addHistory(String userId, String grade, String nameSubject, String titleContent, DateTime createAt,String translatedNameSubject) async{
    return await FirebaseFirestore.instance.collection("History").add({
      "userId": userId,
      "grade": grade,
      "nameSubject":nameSubject,
      "titleContent":titleContent,
      "createAt": createAt,
      "translatedNameSubject": translatedNameSubject
    });
  }
  static Future<QuerySnapshot> getHistory(String userId) async{
    return await FirebaseFirestore.instance.collection("History")
        //.orderBy("createAt",descending: true)
    .where("userId",isEqualTo: userId).get();
  }
  static Future<DocumentSnapshot> getContent(String grade, String nameSubject,String idContent) async{
    return await FirebaseFirestore.instance.collection("Class_Subject").doc(grade).collection("Info")
        .doc(nameSubject).collection("Content").doc(idContent).get();
  }
  static Future<QuerySnapshot> getListSubject(String grade) async{
    return await FirebaseFirestore.instance.collection("Class_Subject")
    .doc(grade)
    .collection("Info")
    .get();
  }
  static Future<List<String>> getListSubjectFromAllGrade() async{
    List<String> listGrade = ["Grade1","Grade2","Grade3","Grade4","Grade5", "Grade6","Grade7","Grade8","Grade9","Grade10","Grade11","Grade12"];
    List<String> listSubject = new List<String>();//= listGrade;
    List<String> b;
    for(String grade in listGrade){
      var documentSubject = await getListSubject(grade);
      for (var subject in documentSubject.docs){
        listSubject.add(subject.id+" - "+subject["nameSubject"]+" - "+grade);
      }
    }
    return Future(()=>listSubject);
    //return listSubject;
  }
  static String getSubjectId(String subjectInfo){
    return subjectInfo.split("-")[0].trim();
  }
  static String getGrade(String subjectInfo){

    return subjectInfo.split("-")[2].trim();
  }
  static Future getListContentFromAllSubject() async{
    List<String> listSubject = await getListSubjectFromAllGrade();
    List<String> listContent = new List<String>();
    for(String subject in listSubject){
      QuerySnapshot listContentDoc = await getListContent(getGrade(subject), getSubjectId(subject));
      for(var doc in listContentDoc.docs){
        listContent.add(subject +" - "+ doc.id);
      }
    }
    return listContent;
  }
}