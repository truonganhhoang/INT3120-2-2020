import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../Database.dart';

// ignore: must_be_immutable
class sentenceDetail extends StatefulWidget {
  String topic;

  sentenceDetail({Key key, @required this.topic}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _sentenceDetail();
  }
}

// ignore: camel_case_types
class _sentenceDetail extends State<sentenceDetail> {
  int currentSentence;
  bool isVietNameseShowing;

  void initState() {
    super.initState();
    currentSentence = 0;
    isVietNameseShowing = false;
    Firebase.initializeApp();
  }

  void handleNext() {
    if (isVietNameseShowing) {
      setState(() {
        currentSentence += 1;
        isVietNameseShowing = false;
      });
    } else {
      setState(() {
        isVietNameseShowing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: database
                .collection("Sentence")
                .where("topic", isEqualTo: widget.topic)
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
                                      widget.topic,
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
                                      snapshot.data.documents[currentSentence]
                                          ["english"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ))),
                              ),
                              Visibility(
                                visible: isVietNameseShowing,
                                child: Column(
                                  children: [
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xff154673)),
                                          margin: EdgeInsets.all(25),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Center(
                                              child: Text(
                                            snapshot.data
                                                    .documents[currentSentence]
                                                ["vietnamese"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ))),
                                    ),
                                  ],
                                ),
                              )
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
                                        if (currentSentence <
                                                snapshot.data.documents.length -
                                                    1 ||
                                            !isVietNameseShowing) {
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
