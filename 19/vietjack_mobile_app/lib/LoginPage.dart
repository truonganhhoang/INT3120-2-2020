import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:vietjack_mobile_app/Auth.dart';
import 'package:vietjack_mobile_app/main.dart';
class LoginPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<LoginPage> {
  User user;
  void signIn(){
    print("aaaaaaaaaaaa");
    signInWithUser().then((user){
      this.user=user;
      print(user.displayName);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return new VietJackNavigationBar(user: user);
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true
      ),
      body: new GoogleSignInButton(
        onPressed: signIn,
      )
    );
  }
}