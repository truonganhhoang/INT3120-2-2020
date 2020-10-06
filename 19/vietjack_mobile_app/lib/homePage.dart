import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Auth.dart';
import 'LoginPage.dart';

class homePage extends StatefulWidget {
  String userName = "name";

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
      body: CustomScrollView(
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              [
                new Header(width: width,height: height,)
              ]
            ),
          ),
          new SliverPadding(
            padding: EdgeInsets.only(top: 10),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("He'd have you all unravel at the"),
                  color: Colors.teal[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Heed not the rabble'),
                  color: Colors.teal[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Sound of screams but the'),
                  color: Colors.teal[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.teal[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution is coming...'),
                  color: Colors.teal[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution, they...'),
                  color: Colors.teal[600],
                ),
              ],
            ),
          ),
        ],
      )
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
