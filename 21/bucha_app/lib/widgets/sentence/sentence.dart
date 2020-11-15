import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Database.dart';

class Sentence extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SentenceState();
  }
}

class _SentenceState extends State<Sentence> {
  List<String> topic = [];
  List<sentence> sentenceList = [];
  String currentTopic;
  sentence currentSentence;

  @override
  void initState() {
    // TODO: implement initState
    getTopic();
  }
  void getTopic() {
    try {
      database.collection("topic").get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((element) => {
            topic.add(element.data()["name"])
        });
      });
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
  void getSentence() {
    try {
      database.collection("Sentence").where("topic",isEqualTo: currentTopic).get().then((QuerySnapshot snapshot){
        snapshot.docs.forEach((element) {
          sentenceList.add( new sentence(element.data()["english"], element.data()["vietnamese"]));
        });
      });
    }
    catch (e) {
      print(e.toString());
      return null;
    }
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffD69AED),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.orange
                    ),
                child: Column(
                  children: [
                    Stack(
                      // height: MediaQuery.of(context).size.height * 0.85,
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
                          padding: EdgeInsets.all(30.0),
                          // child: Expanded(
                          //   child: ListView.builder(
                          //     itemBuilder: (context, index) {
                          //       return new Container();
                          //     },
                          //   ),
                          // ),
                          // child: FutureBuilder(
                          // ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xffD69AED)),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: null,
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: null,
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: null,
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
      ),
    );
  }
}

class sentence {
  final String english;
  final String vietnamese;
  sentence(this.english, this.vietnamese);
}
