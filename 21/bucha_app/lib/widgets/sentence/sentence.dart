import 'dart:math';

import 'package:bucha_app/widgets/sentence/sentenceDetail.dart';
// import 'package:bucha_app/widgets/sentence/sentenceGame.dart';
import 'package:bucha_app/widgets/sentence/sentenceList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Database.dart';
import '../../constants.dart';

class Sentence extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SentenceState();
  }
}

class _SentenceState extends State<Sentence> {
  // List<String> topic = [];
  bool popup;
  String currentTopic;

  @override
  void initState() {
    super.initState();
    popup = false;
  }

  void setPopup() {
    setState(() {
      popup = !popup;
    });
  }

  void setCurrentTopic(String newTopic) {
    setState(() {
      currentTopic = newTopic;
    });
  }

  void setCurrentSentence(String newSentence) {
    setState(() {
      currentTopic = newSentence;
    });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffD69AED),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(context) * 0.03,
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff134115),
                                border: Border.all(
                                    color: Color(0xffC437C7), width: 20.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: MediaQuery.of(context).size.height * 0.85,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff801183),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Center(
                                child: Text(
                                  "CHỦ ĐỀ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 100.0),
                              child: Container(
                                // padding: EdgeInsetsGeometry,
                                decoration: BoxDecoration(),
                                height:
                                    MediaQuery.of(context).size.height * 0.69,
                                child: StreamBuilder(
                                  stream:
                                      database.collection('topic').snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData)
                                      return Center(
                                          child: Text(
                                        'LOADING . . .',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ));
                                    return ListView.builder(
                                      itemCount:
                                          snapshot.data.documents.length ~/ 2,
                                      itemBuilder: (context, index) => new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setCurrentTopic(snapshot
                                                      .data.documents[index * 2]
                                                  ["name"]);
                                              setPopup();
                                            },
                                            child: Container(
                                              decoration: ItemDecoration(),
                                              margin: EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                  bottom: 10.0,
                                                  top: 10.0),
                                              // padding: EdgeInsets.all(20.0),
                                              padding: EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                  bottom: 30.0,
                                                  top: 30.0),
                                              child: Center(
                                                child: Text(
                                                  snapshot.data
                                                          .documents[index * 2]
                                                      ["name"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setCurrentTopic(
                                                    snapshot.data.documents[
                                                        index * 2 + 1]["name"]);
                                                setPopup();
                                              },
                                              child: Container(
                                                decoration: ItemDecoration(),
                                                margin: EdgeInsets.all(5.0),
                                                // padding: EdgeInsets.all(20.0),
                                                padding: EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10.0,
                                                    bottom: 30.0,
                                                    top: 30.0),
                                                child: Center(
                                                  child: Center(
                                                    child: Text(
                                                      snapshot.data.documents[
                                                              index * 2 + 1]
                                                          ["name"],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xffD69AED)),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: popup,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // color: Colors.deepPurple,
                        color: Color.fromRGBO(51, 0, 102, 150),
                        // backgroundBlendMode: BlendMode.modulate,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 60, top: 120, bottom: 150),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff134115),
                                border: Border.all(
                                    color: Colors.green, width: 15.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xff801183),
                                // border: Border.all(color: Colors.green, width: 15.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "LỰA CHỌN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                sentenceDetail(
                                                    topic: currentTopic),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("HỌC BÀI",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontStyle: FontStyle.italic)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => sentenceList(
                                                topic: currentTopic),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.purpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("DANH SÁCH",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontStyle: FontStyle.italic)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       // builder: (context) => sentenceGame(topic: currentTopic),
                                        //       ),
                                        // );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("CHƠI GAME",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontStyle: FontStyle.italic)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              setPopup();
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BoxDecoration ItemDecoration() {
    Random random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return BoxDecoration(
      color: Color.fromARGB(220, red, green, blue),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(100, red, green, blue),
            offset: Offset(0, 10),
            blurRadius: 0.0,
            spreadRadius: 0.0)
      ],
    );
  }
}
