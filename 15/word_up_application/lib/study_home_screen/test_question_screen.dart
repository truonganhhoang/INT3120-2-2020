import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TestQuestionScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TestQuestionScreen();
}

class _TestQuestionScreen extends State<TestQuestionScreen>{
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.all(50),
     decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.all(Radius.circular(15)),
     ),
   );
  }
  void _openPopup(context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}