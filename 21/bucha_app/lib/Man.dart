import 'dart:convert';

import 'package:bucha_app/widgets/options/OptionClass.dart';

import 'package:flutter/material.dart';

import 'ChonMan.dart';
import 'Database.dart';
import 'Vocabulary.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bucha_app/Database.dart';


class ManChoi extends StatefulWidget {
   final String level;
   final String scene;

  ManChoi({this.level,this.scene});

  @override
  _ManChoiState createState() => _ManChoiState();
}

class _ManChoiState extends State<ManChoi> {


  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Vocabulary(
        word: document['word'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xff1B60BD),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 500,
                    margin:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
                    decoration: BoxDecoration(
                        color: Color(0xffA2FB8F),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 50, right: 20, left: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Color(0xff0A2842),
                          borderRadius: BorderRadius.circular(15)),
                      child: StreamBuilder(
                        stream: database.collection("Vocabulary")
                            .where("level", isEqualTo: widget.level ).where("scene", isEqualTo: widget.scene).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return const Text('Coming soon');
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 2.5),
                            itemBuilder: (context, index) => _buildListItem(
                                context, snapshot.data.documents[index]),
                            itemCount: snapshot.data.documents.length,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        color: Color(0xffF76C57),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Chọn Bài",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text(
                        "Học Bài",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xffC822DA),
                    ),
                  ),
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text(
                        "Chơi Game",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xffFC6E64),
                    ),
                  )
                ],
              ),
              Container(
                width: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
