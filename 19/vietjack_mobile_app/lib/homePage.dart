import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Auth.dart';
import 'LoginPage.dart';

class homePage extends StatefulWidget {
  String userName = "name";

  homePage({Key key, this.userName}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
        centerTitle: true,
      ),
      body: new Header(width: width, height: height, userName: widget.userName),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          googleSignOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return new LoginPage();
          }));
        },
        child: new Text("Logout"),
      ),
    );
  }
}

void _onPressed() async {
  FirebaseFirestore.instance.collection("test").get().then((value) {
    value.docs.forEach((element) {
      print(element.data());
    });
  });
}

_onPressed1() async {
  print("asd");
}
