import 'package:EduBox/package/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserDetail with ChangeNotifier {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  String name, email, phoneNumber, address, avatarUrl;
  DateTime birth;
  String gender;

  UserDetail(
      {this.gender,
      this.name,
      this.email,
      this.phoneNumber,
      this.address,
      this.avatarUrl,
      this.birth});

  set setName(value) {
    name = value;
    notifyListeners();
  }

  set setEmail(value) {
    email = value;
    notifyListeners();
  }

  set setAvatarUrl(value) {
    email = value;
    notifyListeners();
  }

  set setAddress(value) {
    address = value;
    notifyListeners();
  }

  set setBirth(value) {
    birth = value;
    notifyListeners();
  }

  set setGender(value) {
    gender = value;
    notifyListeners();
  }

  set setPhoneNumber(value) {
    phoneNumber = value;
    notifyListeners();
  }

  void fromJson(json) {
    setName = json['Name'];
    setAvatarUrl = json['Avatar'];
    setEmail = json['Email'];
    setAddress = json['Address'];
    setBirth = json['Birth'];
    setGender = json['Gender'];
    setPhoneNumber = json['PhoneNumber'];

    notifyListeners();
  }

  Map toJson() {
    return {
      'Address': address,
      'Name': name,
      'Avatar': avatarUrl,
      'Birth': birth,
      'Email': email,
      'Gender': gender,
      'PhoneNumber': phoneNumber,
    };
  }
}
