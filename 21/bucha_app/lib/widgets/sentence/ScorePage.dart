import 'package:bucha_app/constants.dart';
import 'package:bucha_app/main.dart';
import 'package:bucha_app/widgets/sentence/sentenceGame.dart';
import 'package:bucha_app/widgets/sentence/sentenceList.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  final int score;
  final String currentTopic;
  final String nextTopic;
  ScorePage({this.score, this.currentTopic, this.nextTopic});

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  String emotion;
  String subText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emotion = widget.score < 4000 ? "assets/failed.jpg" : "assets/good.jpg";
    subText =
        widget.score < 4000 ? "TRY AGAIN !!!! (҂⌣̀_⌣́)" : "GREAT !!!! ᕕ( ᐛ )ᕗ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width(context),
          height: height(context),
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
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
              Center(
                child: Container(
                  child: Image.asset(emotion),
                ),
              ),
              Center(
                child: Text(
                  subText,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "YOUR SCORE : " + widget.score.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 80.0,
                      right: 80.0,
                      bottom: 100.0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Next"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        sentenceList(topic: widget.nextTopic),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    )),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.next_plan,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Restart"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => sentenceGame(
                                        topic: widget.currentTopic,
                                        nextTopic: widget.nextTopic),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    )),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.restore,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Home"),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    )),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.home,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
              )
              // Expanded(
              //   flex: 2,
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: height(context) * 0.15,
              //       ),
              //       Container(
              //         width: 40.0,
              //         height: 40.0,
              //         margin: const EdgeInsets.only(top: 20, right: 20),
              //         child: RaisedButton(
              //           onPressed: () {
              //             Navigator.of(context).push(new MaterialPageRoute(
              //                 builder: (BuildContext context) => HomePage()));
              //           },
              //           shape: new RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10.0)),
              //           color: Colors.red,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
