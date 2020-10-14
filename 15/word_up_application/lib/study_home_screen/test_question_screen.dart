import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/word.dart';

class TestQuestionScreen extends StatefulWidget {
  final Word word;
  TestQuestionScreen(this.word) : assert(word != null);
  @override
  State<StatefulWidget> createState() => _TestQuestionScreen();
}

class _TestQuestionScreen extends State<TestQuestionScreen> {
  int _chosenAnswer = 0;
  int _correctAnswer = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          answerOption(1),
          answerOption(2),
          answerOption(3),
          answerOption(4)
        ],
      ),
    );
  }

  Container answerOption(int index) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: FlatButton(
          color: getColorAnswerBar(index),
          splashColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(5),
          onPressed: () {
            _chosenAnswer = index;
            print("dd" + _chosenAnswer.toString());
            checkTheAnswer();
          },
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.grey,
                        width: 15,
                      ),
                    ),
                    child: Text(
                      getStrWithIndex(index),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  'I play'
                  'jjjjj'
                  'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'
                  'jjjj soccer',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 2 * SizeConfig.heightMultiplier),
                ))
              ],
            ),
          ),
        ));
  }

  Color getColorAnswerBar(int index) {
    Color color = Colors.white;
    if (index == _chosenAnswer) {
      if (_chosenAnswer == _correctAnswer) {
        color = Colors.green;
      } else
        color = Colors.red;
    }
    return color;
  }

  void checkTheAnswer() {
    setState(() {});
  }

  String getStrWithIndex(int index) {
    switch (index) {
      case 1:
        return 'A';
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
    }
    return 'E';
  }
}
