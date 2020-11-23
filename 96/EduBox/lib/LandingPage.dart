import 'package:EduBox/Authenticate/LoginScreen.dart';
import 'package:EduBox/Home/HomeInterface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final int background;

  const LandingPage({Key key, this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return HomeInterface(background: background);
          return LoginScreen();
        });
  }
}
