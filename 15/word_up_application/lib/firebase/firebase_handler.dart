import 'package:firebase_core/firebase_core.dart';

class FirebaseHandler {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }
}
