import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ScorePage.dart';
import '../../constants.dart';
import 'package:bucha_app/Database.dart';

// ignore: camel_case_types
class vocabulary_game extends StatefulWidget {
    final String level;
    final String scene;

    vocabulary_game({this.level,this.scene});
  
  @override
  _vocabulary_gameState createState() => _vocabulary_gameState();
}

// ignore: camel_case_types
class _vocabulary_gameState extends State<vocabulary_game> {
  var currentQuestion;

  int score;



  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    currentQuestion = 0;
    score=0;
    Firebase.initializeApp();


  }



  checkCorrect(
      String userChoice, String answerCorrect, int size, BuildContext context) {
    if(currentQuestion == size-1){
      Timer(Duration(seconds: 1), ()=> this.setState((){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  ScorePage(score: score,)));
      }));
    }
    if (userChoice == answerCorrect ) {
      final snackbar = SnackBar(
        duration: Duration(microseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Đúng !"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      setState(() {
        score++;
      });
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Sai !"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (currentQuestion < size - 1) {
        currentQuestion++;
      }
    });
  }

  Widget choiceButton(String userChoice, String answer, String answerCorrect,
      int size, BuildContext context) {
    return Container(
      width: width(context) * 0.9,
      height: height(context) * 0.08,
      decoration: BoxDecoration(
          color: Color(0xffCDBBC2), borderRadius: BorderRadius.circular(10.0)),
      child: MaterialButton(
        onPressed: () {
          checkCorrect(userChoice, answerCorrect, size, context);
        },
        child: Text(
          answer,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        minWidth: 200,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: StreamBuilder(
        stream: database.collection("VocabularyQuestion")
            .where("level", isEqualTo: widget.level )
            .where("scene", isEqualTo: widget.scene).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.documents.length == 0)
            return Center(
              child: Text(
                'LOADING . . .',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            );
          return Builder(
            builder: (BuildContext context) => Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: Alignment.topRight,
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/background.jpg"),
                            fit: BoxFit.cover,
                          )),
                        ),
                        Positioned(
                          top: 2,
                          right: 2,
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            margin: const EdgeInsets.only(top: 20, right: 20),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: height(context),
                      decoration: BoxDecoration(
                        color: Color(0xff6B0000),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height(context) * 0.02,
                          ),
                          Container(
                            width: width(context) * 0.4,
                            height: height(context) * 0.08,
                            decoration: BoxDecoration(
                                color: Color(0xffC6375E),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              child: Center(
                                child: Text(
                                  "ĐIỂM : "+score.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                              width: 200,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            height: height(context) * 0.03,
                          ),
                          Container(
                            width: width(context) * 0.9,
                            height: height(context) * 0.08,
                            decoration: BoxDecoration(
                                color: Color(0xffC6375E),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              child: Center(
                                child: Text(
                                  snapshot.data.documents[currentQuestion]
                                      ["question"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                              width: 200,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            height: height(context) * 0.05,
                          ),
                          choiceButton(
                              "a",
                              snapshot.data.documents[currentQuestion]
                                  ["answerA"],
                              snapshot.data.documents[currentQuestion]
                                  ["answerCorrect"],
                              snapshot.data.documents.length,
                              context),
                          SizedBox(
                            height: height(context) * 0.02,
                          ),
                          choiceButton(
                              "b",
                              snapshot.data.documents[currentQuestion]
                                  ["answerB"],
                              snapshot.data.documents[currentQuestion]
                                  ["answerCorrect"],
                              snapshot.data.documents.length,
                              context),
                          SizedBox(
                            height: height(context) * 0.02,
                          ),
                          choiceButton(
                              "c",
                              snapshot.data.documents[currentQuestion]
                                  ["answerC"],
                              snapshot.data.documents[currentQuestion]
                                  ["answerCorrect"],
                              snapshot.data.documents.length,
                              context),
                          SizedBox(
                            height: height(context) * 0.02,
                          ),
                          choiceButton(
                              "d",
                              snapshot.data.documents[currentQuestion]
                                  ["answerD"],
                              snapshot.data.documents[currentQuestion]
                                  ["answerCorrect"],
                              snapshot.data.documents.length,
                              context),
                          SizedBox(
                            height: height(context) * 0.02,
                          ),
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
    ));
  }
}
