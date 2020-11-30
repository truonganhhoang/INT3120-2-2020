import 'package:cloud_firestore/cloud_firestore.dart';

class ExamAPI {
  static List<String> getListSubject() {
    List<String> listSubject = [];
    FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .get()
        .then((value) {
      for (dynamic data in value.docs) {
        listSubject.add(data.documentID);
      }
    });
    return listSubject;
  }

  static Future<QuerySnapshot> getSubjectDetail(String currentSubject) async {
    return await FirebaseFirestore.instance
        .collection("ThiOnline")
        .doc("Class 12")
        .collection("Subject")
        .doc(currentSubject)
        .collection("Detail")
        .orderBy("id")
        .get();
  }
}
