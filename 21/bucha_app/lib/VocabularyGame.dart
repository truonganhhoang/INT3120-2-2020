import 'package:bucha_app/VocabularyQuestion.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class vocabulary_game extends StatefulWidget {
  @override
  _vocabulary_gameState createState() => _vocabulary_gameState();
}

class _vocabulary_gameState extends State<vocabulary_game> {
  var counter = 0;

  List qText = [
    VocabularyQuestion("Tomorow", "aaa", "bbb", "ccc", "ddd", "a"),
    VocabularyQuestion("Tomorow", "aaa", "bbb", "ccc", "ddd", "a"),
    VocabularyQuestion("Tomorow", "aaa", "bbb", "ccc", "ddd", "a"),
    VocabularyQuestion("Tomorow", "aaa", "bbb", "ccc", "ddd", "a"),
    VocabularyQuestion("Tomorow", "aaa", "bbb", "ccc", "ddd", "a"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    margin: const EdgeInsets.only(top: 20,right: 20),
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
                    height: height(context) * 0.05,
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
                          "Tomorrow",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.1,
                  ),
                  Container(
                      width: width(context) * 0.9,
                      height: height(context) * 0.08,
                      decoration: BoxDecoration(
                          color: Color(0xffCDBBC2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Ngày mai",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Container(
                      width: width(context) * 0.9,
                      height: height(context) * 0.08,
                      decoration: BoxDecoration(
                          color: Color(0xffCDBBC2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Ngày Kia",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Container(
                      width: width(context) * 0.9,
                      height: height(context) * 0.08,
                      decoration: BoxDecoration(
                          color: Color(0xffCDBBC2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Ngày kìa",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Container(
                      width: width(context) * 0.9,
                      height: height(context) * 0.08,
                      decoration: BoxDecoration(
                          color: Color(0xffCDBBC2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Ngày qua",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
