import 'dart:async';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../constants.dart';
import '../../Database.dart';
import 'ScorePage.dart';

// ignore: must_be_immutable
class sentenceGame extends StatefulWidget {
  final String topic;
  final String nextTopic;
  sentenceGame({Key key, @required this.topic, @required this.nextTopic})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _sentenceGame();
  }
}

// ignore: camel_case_types
class _sentenceGame extends State<sentenceGame> {
  int currentSentence;
  // bool isVietNameseShowing;
  int score;
  bool result;
  var test;
  var answer;
  var temp;
  void initState() {
    super.initState();
    score = 0;
    result = false;
    currentSentence = 0;
    database
        .collection("Sentence")
        .where("topic", isEqualTo: widget.topic)
        .snapshots()
        .forEach((element) {});
    _getTest();
    temp = [];
    Firebase.initializeApp();
  }

  _getTest() async {
    database
        .collection("Sentence")
        .where("topic", isEqualTo: widget.topic)
        .limit(1)
        .get()
        .then((value) => {
              setState(() {
                answer = value.docs[0]['english'];
                test = shuffle(value.docs[0]['test']);
              })
            });
  }

  String convertToString(arr) {
    var answer = "";
    for (var ans in arr) {
      answer == "" ? answer += ans : answer += " " + ans;
    }
    print(answer);
    return answer;
  }

  List shuffle(List test) {
    var random = new Random();
    for (var i = 0; i < test.length; i++) {
      var n = random.nextInt(i + 1);
      var temp = test[i];
      test[i] = test[n];
      test[n] = temp;
    }
    return test;
  }

  void handleAdd(String ans) {
    setState(() {
      temp.add(ans);
      test.remove(ans);
    });
    // print(convertToString(temp));
  }

  void handleDel(String ans) {
    setState(() {
      temp.remove(ans);
      test.add(ans);
    });
  }

  void handleSkip(context, nextTest) {
    setState(() {
      if (nextTest == 0) {
        Timer(
            Duration(microseconds: 100),
            () => this.setState(() {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => ScorePage(
                            score: score,
                            currentTopic: widget.topic,
                            nextTopic: widget.nextTopic,
                          )));
                }));
      }
      test = shuffle(nextTest['test']);
      answer = nextTest['english'];
      temp = [];
      currentSentence += 1;
      final snackbar = SnackBar(
        duration: Duration(microseconds: 800),
        backgroundColor: Colors.blue,
        content: Center(
          child: Text(
            "SKIP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    });
  }

  void handleNext(context, nextTest) {
    setState(() {
      print(nextTest);
      print(convertToString(temp) == answer);
      convertToString(temp) == answer ? result = true : result = false;
      if (result) {
        final snackbar = SnackBar(
          duration: Duration(microseconds: 800),
          backgroundColor: Colors.green,
          content: Center(
            child: Text(
              "+ 500 ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      } else {
        final snackbar = SnackBar(
          duration: Duration(milliseconds: 100),
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "- 200",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      }
      score = result ? score + 500 : score - 200;
      if (nextTest == 0) {
        Timer(
            Duration(seconds: 1),
            () => this.setState(() {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => ScorePage(
                            score: score,
                            currentTopic: widget.topic,
                            nextTopic: widget.nextTopic,
                          )));
                }));
      }
      test = shuffle(nextTest['test']);
      answer = nextTest['english'];
      temp = [];
      currentSentence += 1;
    });
  }

  Wrap buildAnswer(list, isAnswer) {
    return Wrap(
      children: list
          .map<Widget>((ans) => FittedBox(
                child: GestureDetector(
                  onTap: () {
                    if (isAnswer) {
                      handleDel(ans);
                    } else {
                      handleAdd(ans);
                    }
                  },
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        ans,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
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
                  width: width(context),
                  height: height(context),
                  color: Color(0xff3fe7f1),
                  child: Column(
                    children: [
                      Container(
                        height: height(context) * 0.3,
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
                                margin:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        )),
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.clear,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 2,
                              left: 20,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      )),
                                  child: SizedBox(
                                    width: 100,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        "Score: ${score}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          // flex: 2,
                          height: height(context) - height(context) * 0.3 - 24,
                          child: Container(
                            width: width(context),
                            decoration: BoxDecoration(
                              // color: Color(0xff41261b),
                              color: Color(0xff583204),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: width(context),
                                        height: height(context) * 0.15,
                                        decoration: BoxDecoration(
                                          color: Color(0xff41261b),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 5.0, right: 5.0),
                                        child: Center(
                                          child: buildAnswer(temp, true),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width(context) * 0.4,
                                  height: height(context) * 0.03,
                                  margin: EdgeInsets.only(bottom: 8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "${currentSentence + 1} / ${snapshot.data.documents.length}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width(context) * 0.9,
                                  height: height(context) * 0.08,
                                  decoration: BoxDecoration(
                                      color: Color(0xffC6375E),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Container(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Text(
                                          "${snapshot.data.documents[currentSentence]['vietnamese']}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    height: 60,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, right: 8, left: 8),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: width(context),
                                        height: height(context) * 0.25,
                                        decoration: BoxDecoration(
                                          color: Color(0xff41261b),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 5.0, right: 5.0),
                                        child: Center(
                                          child: buildAnswer(test, false),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (currentSentence <
                                              snapshot.data.documents.length -
                                                  1) {
                                            handleSkip(
                                                context,
                                                snapshot.data.documents[
                                                    currentSentence + 1]);
                                          } else {
                                            handleSkip(context, 0);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              )),
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Icon(
                                              Icons.skip_next,
                                              size: 40,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (currentSentence <
                                              snapshot.data.documents.length -
                                                  1) {
                                            handleNext(
                                                context,
                                                snapshot.data.documents[
                                                    currentSentence + 1]);
                                          } else {
                                            handleNext(context, 0);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.lightGreenAccent,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              )),
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Icon(
                                              Icons.navigate_next,
                                              size: 40,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}

// class Answer extends StatelessWidget {
//   const Answer({
//     Key key,
//     @required this.answer,
//   }) : super(key: key);

//   final answer;

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: answer
//           .map<Widget>((ans) => FittedBox(
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     height: 40,
//                     margin: EdgeInsets.all(8.0),
//                     padding: EdgeInsets.only(left: 10, right: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.yellow,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Center(
//                       child: Text(
//                         ans,
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ))
//           .toList(),
//     );
//   }
// }
