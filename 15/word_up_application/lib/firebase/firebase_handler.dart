import 'package:firebase_core/firebase_core.dart';

class FirebaseHandler {
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }
}
