import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:vietjack_mobile_app/Auth.dart';
import 'package:vietjack_mobile_app/main.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user;

  void signIn() {
    print("aaaaaaaaaaaa");
    signInWithUser().then((user) {
      this.user = user;
      print(user.displayName);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return new VietJackNavigationBar();
      }));
    });
  }
  Widget loginScene(){
    return new Scaffold(//login scene
        appBar: new AppBar(title: new Text("Login"), centerTitle: true),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                child: new Image.asset(
                    'assets/loginImage.png',
                  fit: BoxFit.fill,
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top:50),
                child: new Center(
                  child: new Container(
                    width: 300,
                    height: 70,
                    child: new GoogleSignInButton(
                      onPressed: signIn,
                      darkMode: true,
                      centered: true,
                      borderRadius: 20,
                      splashColor: Colors.purple,
                      text: 'Đăng nhập với Google'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  Future app;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    app = getApp();
  }

  Future getApp() async {
    return await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: app,
      builder: (context, snapshot) {
        Widget w;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            w = new Text("No Internet");
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            w = new Text("Loading ...");
            break;
          case ConnectionState.done:
            w = (FirebaseAuth.instance.currentUser == null)
                ? loginScene()
                : new VietJackNavigationBar();
            break;
          default:
            w = new Text("Default");
            break;
        }
        return w;
      },
    );
  }
}

// if(FirebaseAuth.instance.currentUser!=null) return new VietJackNavigationBar();
// return new Scaffold(
//     appBar: new AppBar(
//         title: new Text("Login"),
//         centerTitle: true
//     ),
//     body: new GoogleSignInButton(
//       onPressed: signIn,
//     )
// );
