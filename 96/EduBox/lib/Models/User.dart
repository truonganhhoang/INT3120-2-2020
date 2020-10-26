import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserDetail {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  final db = FirebaseFirestore.instance;
  String name, email, phoneNumber, address, avatarUrl;
  DateTime birth;
  String gender;
  Stream detail;


// set setName(value) {
  //   name = value;
  //   notifyListeners();
  // }
  //
  // set setEmail(value) {
  //   email = value;
  //   notifyListeners();
  // }
  //
  // set setAvatarUrl(value) {
  //   email = value;
  //   notifyListeners();
  // }
  //
  // set setAddress(value) {
  //   address = value;
  //   notifyListeners();
  // }
  //
  // set setBirth(value) {
  //   birth = value;
  //   notifyListeners();
  // }
  //
  // set setGender(value) {
  //   gender = value;
  //   notifyListeners();
  // }
  //
  // set setPhoneNumber(value) {
  //   phoneNumber = value;
  //   notifyListeners();
  // }
  //
  // void fromMap(map) {
  //   setName = map['Name'];
  //   setAvatarUrl = map['Avatar'];
  //   setEmail = map['Email'];
  //   setAddress = map['Address'];
  //   setBirth = map['Birth'];
  //   setGender = map['Gender'];
  //   setPhoneNumber = map['PhoneNumber'];
  //
  //   notifyListeners();
  // }
  //
  // Map toMap() {
  //   return {
  //     'Address': address,
  //     'Name': name,
  //     'Avatar': avatarUrl,
  //     'Birth': birth,
  //     'Email': email,
  //     'Gender': gender,
  //     'PhoneNumber': phoneNumber,
  //   };
  //}
}
