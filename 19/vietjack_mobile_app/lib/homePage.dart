import 'package:flutter/material.dart';
import 'Header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String name;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Home Page"),
          centerTitle: true,
        ),
        body: new Header(width: width, height: height),
        floatingActionButton: new FloatingActionButton(onPressed: _onPressed,child: new Text("test firestore"),),

    );
  }
}
void _onPressed() async {
  await Firebase.initializeApp();
  FirebaseFirestore.instance.collection("test").get().then((value) {
    value.docs.forEach((element) {
      print(element.data());
    });
  });

}