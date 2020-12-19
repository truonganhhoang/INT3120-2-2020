import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../Database.dart';

// ignore: camel_case_types
class vocabularyStudy extends StatefulWidget {
  final String level;
  final String scene;

  const vocabularyStudy({Key key, this.level, this.scene}) : super(key: key);

  @override
  _vocabularyStudyState createState() => _vocabularyStudyState();
}

// ignore: camel_case_types
class _vocabularyStudyState extends State<vocabularyStudy> {
  int currentVocabulary;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentVocabulary = 0;
    Firebase.initializeApp();
  }

  void handleNext() {
    setState(() {
      currentVocabulary += 1;
    });
  }

  void handlePre() {
    setState(() {
      currentVocabulary -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: database
                .collection("Vocabulary")
                .where("level", isEqualTo: widget.level)
                .where("scene", isEqualTo: widget.scene)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data.documents.length == 0)
                return Center(
                    child: Text(
                  'LOADING . . .',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ));
              return Container(
                height: MediaQuery.of(context).size.height,
                color: Color(0xff3fe7f1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                              color: Color(0xff0A1A52),
                              border: Border.all(
                                  width: 15.0, color: Color(0xff8BF8FF)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff3DDAFD)),
                                    margin: EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 40,
                                        bottom: 10),
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Text(
                                      "TỪ VỰNG LỚP " + widget.level,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 10,
                                            color: Color(0xffBEE4EC)),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff154673)),
                                    margin: EdgeInsets.all(20),
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Text(
                                      snapshot.data.documents[currentVocabulary]
                                          ["word"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffEAEC89)),
                                    margin: EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 30,
                                        bottom: 10),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Center(
                                        child: Text(
                                      "NGHĨA",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 10,
                                            color: Color(0xffBEE4EC)),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff154673)),
                                    margin: EdgeInsets.all(25),
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Center(
                                        child: Text(
                                      snapshot.data.documents[currentVocabulary]
                                          ["meaning"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: RaisedButton(
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 20,
                                      ),
                                      color: Colors.yellow,
                                      onPressed: () {
                                        if (currentVocabulary > 0) {
                                          handlePre();
                                        }
                                      })),
                              SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })),
                              SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: RaisedButton(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                      ),
                                      color: Colors.yellow,
                                      onPressed: () {
                                        if (currentVocabulary <
                                            snapshot.data.documents.length -
                                                1) {
                                          handleNext();
                                        }
                                      })),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
