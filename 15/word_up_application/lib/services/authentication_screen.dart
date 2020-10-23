import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/services/auth_service.dart';
import 'package:word_up_application/user_profile_screen/user_profile_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInGoogleButton(),
              SizedBox(height: 50),
              _signInFacebookButton(),
              SizedBox(height: 50,),
              _continueAsGuest(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInGoogleButton() {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      onPressed: () {
        AuthService().signInWithGoogle().then((result){
          if(result != null) print('login successful');
        },);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors: [
                  Colors.lightBlue,
                  Colors.white,
                ]),
            borderRadius: BorderRadius.circular(40.0),
        ),
        width: 270,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image(
                  image: AssetImage("assets/sprites/GoogleIcon.png"),
                  height: 30.0),
            ),
            Expanded(
                child: Center(
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _signInFacebookButton() {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [
                Colors.lightBlue,
                Colors.white,
              ]),
          borderRadius: BorderRadius.circular(40.0),
        ),
        width: 270,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image(
                  image: AssetImage("assets/sprites/facebookIcon.png"),
                  height: 30.0),
            ),
            Expanded(
                child: Center(
                  child: Text(
                    'Sign in with Facebook',
                    style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _continueAsGuest(){
    return RaisedButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [
                Colors.brown,
                Colors.black,
              ]),
          borderRadius: BorderRadius.circular(40.0),
        ),
        width: 270,
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text(
                    'Continue as Guest',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
