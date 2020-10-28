import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/home/home_screen.dart';
import 'package:word_up_application/services/auth_service.dart';
import 'package:word_up_application/user_profile_screen/user_profile_screen.dart';

import '../size_config.dart';

class AuthenticationScreen extends StatefulWidget {
  final bool noGuest;
  AuthenticationScreen({this.noGuest});
  @override
  State<StatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor('#E7E8EA'),
        // color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              _signInGoogleButton(),
              SizedBox(height: 50),
              _signInFacebookButton(),
              SizedBox(
                height: 50,
              ),
              if(!widget.noGuest) _continueAsGuest(),
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
        _onLoading();
        AuthService().signInWithGoogle().then(
          (result) {
            Navigator.of(context, rootNavigator: true).pop();
            if (result != null) {
              print('login successful');
              _showHelloUser(AuthService.instance.auth.currentUser.displayName);
              _moveToHome();
            }
            else _showCanNotLogin();
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
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
      onPressed: () {
        AuthService.instance.signInWithFacebook();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.indigo,
              ]),
          borderRadius: BorderRadius.circular(40.0),
        ),
        width: 270,
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  width: 30,
                  child: Text(
                    'f',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
            Expanded(
                child: Center(
              child: Text(
                'Sign in with Facebook',
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

  Widget _continueAsGuest() {
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
                Colors.blueGrey,
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

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _loading();
      },
    );
  }

  Widget _loading() {
    return Center(
      child: Container(
        child: LoadingBouncingGrid.square(
          size: 8 * SizeConfig.heightMultiplier,
          backgroundColor: Colors.blue,
          inverted: true,
        ),
      ),
    );
  }

  void _showHelloUser(String userName) {
    EdgeAlert.show(context,
        icon: Icons.tag_faces,
        backgroundColor: HexColor('#8F8FDD'),
        title: 'Hi ' + userName,
        gravity: EdgeAlert.TOP,
        duration: 2);
  }

  void _showCanNotLogin(){
    EdgeAlert.show(context,
        icon: Icons.sentiment_dissatisfied,
        backgroundColor: HexColor('#8F8FDD'),
        title: 'Oops',
        description: 'Something went wrong, Please try again.',
        gravity: EdgeAlert.TOP,
        duration: 1);
  }

  void _moveToHome() async{
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }
}
