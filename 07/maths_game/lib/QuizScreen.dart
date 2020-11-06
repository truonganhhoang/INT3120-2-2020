import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'dart:math';

import 'package:maths_game/ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  String calculation;

  QuizScreen(this.calculation);

  _QuizScreen createState() => _QuizScreen(calculation);
}

class _QuizScreen extends State<QuizScreen> {
  String calculation;
  int numberOfQuestion = 0;
  int stateIndex = 0;
  int number1;
  int number2;
  int trueAnswer = 0;
  int rightAnswerNumberIndexLeft;
  int choice1Index, choice2Index, choice3Index, choice4Index;
  List<String> answerList = new List<String>();
  var random = new Random();
  MaterialColor choice1 = Colors.grey;
  MaterialColor choice2 = Colors.grey;
  MaterialColor choice3 = Colors.grey;
  MaterialColor choice4 = Colors.grey;

  void _navigateBack(BuildContext context) {
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

  _QuizScreen(String cal) {
    this.calculation = cal;
    number1 = random.nextInt(20) + 1;
    number2 = random.nextInt(20) + 1;
    // getRandomCalculation(number1, number2);
  }
  //constructor

  checkAnswer(int numberIndexLeft, BuildContext context) {
    setState(() {
      if (numberIndexLeft == rightAnswerNumberIndexLeft) {
        trueAnswer++;
      } else {
        trueAnswer--;
      }
      if (rightAnswerNumberIndexLeft == 4) {
        choice4 = Colors.green;
        choice3 = Colors.red;
        choice2 = Colors.red;
        choice1 = Colors.red;
      } else if (rightAnswerNumberIndexLeft == 3) {
        choice3 = Colors.green;
        choice4 = Colors.red;
        choice2 = Colors.red;
        choice1 = Colors.red;
      } else if (rightAnswerNumberIndexLeft == 2) {
        choice2 = Colors.green;
        choice4 = Colors.red;
        choice3 = Colors.red;
        choice1 = Colors.red;
      } else if (rightAnswerNumberIndexLeft == 1) {
        choice1 = Colors.green;
        choice4 = Colors.red;
        choice2 = Colors.red;
        choice3 = Colors.red;
      }
      stateIndex++;
      numberOfQuestion++;
      if (numberOfQuestion == 20)
        Timer _timer = Timer(Duration(seconds: 2), () {
          _navigateToResultScreen(context);
        });
    });
  }
  // each choice has different number of Index left in index list when they call getIndex function
  // this fuction checks if choice's numberIndexLeft equals to the numberIndexLeft of the right answer (similar to ID check)

  @override
  Widget build(BuildContext context) {
    String calculateIcon, result;
    int randomAnswer1, randomAnswer2, randomAnswer3;
    int duplicateTime;
    if (stateIndex % 2 == 0) {
      duplicateTime = random.nextInt(10) + 1;
      randomAnswer1 = (random.nextInt(500));
      randomAnswer2 = (random.nextInt(499));
      randomAnswer3 = (random.nextInt(499));
      while (randomAnswer2 == randomAnswer1)
        randomAnswer2 = (random.nextInt(499));
      while (randomAnswer2 == randomAnswer3 || randomAnswer3 == randomAnswer1)
        randomAnswer3 = (random.nextInt(499));
    }

    if (this.calculation == "plus")
      calculateIcon = " + ";
    else if (this.calculation == 'minus')
      calculateIcon = " - ";
    else if (this.calculation == 'duplicate')
      calculateIcon = " x ";
    else if (this.calculation == 'divide') calculateIcon = " : ";

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
      if (stateIndex % 2 == 0) number1 = duplicateTime * number2;
      result = (number1 ~/ number2).toString();
      // right answer
      // ~/ is division return integer, / return double
    }
    question = number1.toString() + calculateIcon + number2.toString() + " =";
    //create question

    if (stateIndex % 2 == 0) {
      answerList.clear();
      answerList.add(result);
      answerList.add(randomAnswer1.toString());
      answerList.add(randomAnswer2.toString());
      answerList.add(randomAnswer3.toString());
      // insert 4 answers into list
    }

    List<int> indexList = List<int>();
    indexList.add(0);
    indexList.add(1);
    indexList.add(2);
    indexList.add(3);
    //insert 4 indexes of list

    int getIndex(int numberIndexLeft) {
      int x = random.nextInt(numberIndexLeft);
      int y = indexList.elementAt(x);
      if (y == 0) rightAnswerNumberIndexLeft = numberIndexLeft;
      // y = 0 is the index of result in answerList
      // the choice which got y = 0 is the right choice so its numberIndexleft is the numberIndexleft of the right answer
      indexList.remove(y);
      return y;
      // y is a random index value from 0 to 3, each time a value y is chosen, remove it from available indexList
    }

    if (stateIndex % 2 == 0) {
      choice4Index = getIndex(4);
      choice3Index = getIndex(3);
      choice2Index = getIndex(2);
      choice1Index = getIndex(1);
    }

    int nextQuestion() {
      Timer _timer = Timer(Duration(seconds: 2), () {
        setState(() {
          number1 = random.nextInt(20) + 1;
          number2 = random.nextInt(20) + 1;
          choice1 = Colors.grey;
          choice2 = Colors.grey;
          choice3 = Colors.grey;
          choice4 = Colors.grey;
          stateIndex++;
        });
      });
      // the code will run after 2 seconds
    }

    return Scaffold(
      body: Container(
        child: GridView.count(
          childAspectRatio: (1.7 / 1),
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
                  alignment: Alignment(0.1, -1),
                  child: Container(
                    width: 140,
                    height: 140,
                    child: Align(
                      alignment: Alignment(-0.5, 0),
                      child: Text("  " + trueAnswer.toString(),
                          style: TextStyle(fontSize: 70)),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/Number of Right Answer.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 3,
              children: [
                Text(""),
                Align(
                  alignment: Alignment(0.6, -1),
                  child: Text(
                    question,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "images/female_teacher_1.png",
                    scale: 0.8,
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment(-0.2, -1.5),
                  child: Image.asset(
                    "images/exam_paper.png",
                  ),
                ),
                GridView.count(
                  crossAxisCount: 5,
                  childAspectRatio: 2.5 / 1,
                  children: [
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    InkWell(
                      child: Text(
                        answerList.elementAt(choice4Index),
                        style:
                            TextStyle(backgroundColor: choice4, fontSize: 32),
                      ),
                      onTap: () {
                        checkAnswer(4, context);
                        nextQuestion();
                      },
                    ),
                    InkWell(
                      child: Text(
                        answerList.elementAt(choice3Index),
                        style:
                            TextStyle(backgroundColor: choice3, fontSize: 32),
                      ),
                      onTap: () {
                        checkAnswer(3, context);
                        nextQuestion();
                      },
                    ),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    Text(""),
                    InkWell(
                      child: Text(
                        answerList.elementAt(choice2Index),
                        style:
                            TextStyle(backgroundColor: choice2, fontSize: 32),
                      ),
                      onTap: () {
                        checkAnswer(2, context);
                        nextQuestion();
                      },
                    ),
                    InkWell(
                      child: Text(
                        answerList.elementAt(choice1Index),
                        style:
                            TextStyle(backgroundColor: choice1, fontSize: 32),
                      ),
                      onTap: () {
                        checkAnswer(1, context);
                        nextQuestion();
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/class_background.jpg"),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
