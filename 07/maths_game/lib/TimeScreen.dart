import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'dart:math';

import 'package:maths_game/ResultScreen.dart';

class TimeScreen extends StatefulWidget {
  String calculation;

  TimeScreen(this.calculation);

  _TimeScreen createState() => _TimeScreen(calculation);
}

class _TimeScreen extends State<TimeScreen> {
  String calculation;
  int numberOfQuestion = 0;
  int number1 = 1;
  int number2 = 1;
  int trueAnswer = 0;
  var random = new Random();
  int duplicateTime;
  int gameTime = 300;
  bool isBack = false;
  FocusNode playerAnswer = new FocusNode();
  final myController = TextEditingController();
  Timer _gameTimer;

  void _navigateBack(BuildContext context) {
    setState(() {
      isBack = true;
      _gameTimer.cancel();
    });
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => GameModeScreen(widget.calculation)));
  }

  // Back function
  void _navigateToResultScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            new ResultScreen(widget.calculation, trueAnswer)));
  }

  _TimeScreen(String cal) {
    this.calculation = cal;
    duplicateTime = random.nextInt(50);
    _gameTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (gameTime <= 0) {
          _gameTimer.cancel();
          _navigateToResultScreen(context);
        }
        gameTime--;
      });
    });
    // getRandomCalculation(number1, number2);
  }
  //constructor

  int nextQuestion() {
    Timer _timer = Timer(Duration(seconds: 1), () {
      number1 = random.nextInt(20) + 1;
      number2 = random.nextInt(20) + 1;
      duplicateTime = random.nextInt(50);
    });
  }

  checkAnswer(int playerAnswer, int result) {
    setState(() {
      if (result == playerAnswer)
        trueAnswer++;
      else
        trueAnswer--;
      nextQuestion();
    });
  }
  // each choice has different number of Index left in index list when they call getIndex function
  // this fuction checks if choice's numberIndexLeft equals to the numberIndexLeft of the right answer (similar to ID check)

  @override
  Widget build(BuildContext context) {
    String calculateIcon, result;

    if (widget.calculation == "plus")
      calculateIcon = " + ";
    else if (widget.calculation == 'minus')
      calculateIcon = " - ";
    else if (widget.calculation == 'duplicate')
      calculateIcon = " x ";
    else if (widget.calculation == 'divide') calculateIcon = " : ";

    String question = "none";
    if (calculation == "plus") {
      result = (number1 + number2).toString();
      // right answer
    } else if (calculation == "minus") {
      result = (number1 - number2).toString();
      // right answer
    } else if (calculation == "duplicate") {
      result = (number1 * number2).toString();
      // right answer
    } else if (calculation == "divide") {
      number1 = duplicateTime * number2;
      result = (number1 ~/ number2).toString();
      // right answer
      // ~/ is division return integer, / return double
    }
    question = number1.toString() + calculateIcon + number2.toString() + " =";
    //create question

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: GridView.count(
          childAspectRatio: (2.1 / 1),
          crossAxisCount: 1,
          children: [
            Stack(
              children: [
                InkWell(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "images/back_image.png",
                      scale: 1.7,
                    ),
                  ),
                  onTap: () {
                    _navigateBack(context);
                  },
                ),
                Align(
                  alignment: Alignment(-0.3, -1),
                  child: Container(
                    width: 120,
                    height: 110,
                    child: Align(
                      alignment: Alignment(-0.3, 0),
                      child: Text("  " + trueAnswer.toString(),
                          style: TextStyle(fontSize: 50)),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/Number of Right Answer.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment(0.5, -1),
                  child: Container(
                    width: 120,
                    height: 110,
                    child: Align(
                      alignment: Alignment(-0.5, 0),
                      child: Text("  " + gameTime.toString(),
                          style: TextStyle(fontSize: 50)),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/timer_theme.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment(-2, 0.3),
                  child: Container(
                    child: Image.asset(
                      "images/female_teacher_2.png",
                      scale: 1.1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -1),
                  child: Text(
                    question,
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                Align(
                  alignment: Alignment(0.7, -1.3),
                  child: Container(
                    width: 85,
                    height: 75,
                    child: TextField(
                        controller: myController,
                        focusNode: playerAnswer,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 36),
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        onSubmitted: (String str) {
                          checkAnswer(int.parse(str), int.parse(result));
                          myController.clear();
                        }),
                  ),
                ),
              ],
            ),
            InkWell(
              child: Image.asset("images/calculator.png"),
              onTap: () {
                playerAnswer.requestFocus();
              },
            )
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/class_background_2.jpg"),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
