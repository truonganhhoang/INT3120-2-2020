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
  void signIn(){
    print("aaaaaaaaaaaa");
    signInWithUser().then((user){
      this.user=user;
      print(user.displayName);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return new VietJackNavigationBar();
      }));
    });
  }
  Future app;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    app=getApp();
  }
  Future getApp()async{
    return await Firebase.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Future(() async {
      //   return await Firebase.initializeApp();
      // }),
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
            w = (FirebaseAuth.instance.currentUser==null) ? new Scaffold( appBar: new AppBar( title: new Text("Login"), centerTitle: true ), body: new GoogleSignInButton( onPressed: signIn, ))  : new VietJackNavigationBar();
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