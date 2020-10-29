import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetail {
  static var db = FirebaseFirestore.instance;
  static String uid = FirebaseAuth.instance.currentUser.uid;
  String name, email, phoneNumber, address, avatarUrl;
  static DateTime birth;
  static String gender;

  getPhoneNumber() async {
    await db.collection('User').doc(uid).get().then((value) => phoneNumber = value.data()['PhoneNumber']);
  }

  String userPhone() => phoneNumber;

}