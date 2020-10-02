import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'dart:math';

import 'package:maths_game/ResultScreen.dart';

class TrueOrFalseScreen extends StatefulWidget {
  String calculation;

  TrueOrFalseScreen(this.calculation);

  _TrueOrFalseScreen createState() => _TrueOrFalseScreen(calculation);
}

class _TrueOrFalseScreen extends State<TrueOrFalseScreen> {
  /* getRandomCalculation(int number1,int number2) {
    getData(number1,number2,calculation).then((val) => setState(() {
      map = val;
    }));
  }
  //Khi vừa khởi tạo _TrueOrFalseScreen gọi hàm GetRandomCalculation, đợi khi GetRandomCalculation
  // chạy xong thì truyền kết quả của nó là val vào map và Setstate()

  getData(int number1,int number2,String calculation) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "working_data.db");

    ByteData data = await rootBundle.load(join("Database", "maths_game_database.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);
    // open database but have to wait a bit
    var db = await openDatabase(path, readOnly: true);
    var res = await  db.query(calculation, where: "number1 = ? and number2 = ?", whereArgs: [number1,number2]);
    // query returns List<Map> and have to wait a bit too
    return res;
  }
  // Lấy dữ liệu với cột number1 có giá trị là number1, cột number2 có giá trị là number2 tại bảng calculation

  List<Map> map = new List<Map>();
  // list of random calculation - in this mode length = 1 */

  String resultImage, resultText;
  MaterialColor resultTextColor;
  String calculation;
  int numberOfQuestion = 0;
  int number1;
  int number2;
  int trueAnswer = 0;
  int falseAnswer = 0;
  var random = new Random();

  void _navigateBack(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            new GameModeScreen(widget.calculation)));
  }
  // Back function

  void _navigateToResultScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            new ResultScreen(widget.calculation, trueAnswer - falseAnswer)));
  }

  _TrueOrFalseScreen(String cal) {
    this.calculation = cal;
    number1 = random.nextInt(10) + 1;
    number2 = random.nextInt(10) + 1;
    // getRandomCalculation(number1, number2);
  }
  //constructor

  void checkAnswer(String result, String choice) {
    setState(() {
      if ((((number1 + number2).toString() == result) ||
              ((number1 - number2).toString() == result) ||
              ((number1 * number2).toString() == result) ||
              ((number1 ~/ number2).toString() == result)) &&
          choice == "true") {
        trueAnswer++;
        resultImage = "images/smile_face.png";
        resultText = "Correct!";
        resultTextColor = Colors.green;
      } else if ((((number1 + number2).toString() == result) ||
              ((number1 - number2).toString() == result) ||
              ((number1 * number2).toString() == result) ||
              ((number1 ~/ number2).toString() == result)) &&
          choice == "false") {
        falseAnswer++;
        resultImage = "images/cry_face.png";
        resultText = "Wrong!";
        resultTextColor = Colors.red;
      } else if ((((number1 + number2).toString() != result) ||
              ((number1 - number2).toString() != result) ||
              ((number1 * number2).toString() != result) ||
              ((number1 ~/ number2).toString() != result)) &&
          (choice == "false")) {
        trueAnswer++;
        resultImage = "images/smile_face.png";
        resultText = "Correct!";
        resultTextColor = Colors.green;
      } else if ((((number1 + number2).toString() != result) ||
              ((number1 - number2).toString() != result) ||
              ((number1 * number2).toString() != result) ||
              ((number1 ~/ number2).toString() != result)) &&
          choice == "true") {
        falseAnswer++;
        resultImage = "images/cry_face.png";
        resultText = "Wrong!";
        resultTextColor = Colors.red;
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                Image.asset(
                  resultImage,
                  scale: 1.1,
                ),
                Text(""),
                Text(
                  resultText,
                  style:
                      TextStyle(backgroundColor: resultTextColor, fontSize: 36),
                  textAlign: TextAlign.center,
                )
              ],
            );
          });

      Timer _timer = Timer(Duration(seconds: 1), () {
        Navigator.pop(context, true);
      });

      number1 = random.nextInt(10) + 1;
      number2 = random.nextInt(10) + 1;

      numberOfQuestion++;
      if (numberOfQuestion == 20)
        Timer _timer = Timer(Duration(seconds: 2), () {
          _navigateToResultScreen(context);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    String calculateIcon, result;
    int test;
    test = random.nextInt(10);

    if (widget.calculation == "plus")
      calculateIcon = " + ";
    else if (widget.calculation == 'minus')
      calculateIcon = " - ";
    else if (widget.calculation == 'duplicate')
      calculateIcon = " x ";
    else if (widget.calculation == 'divide') calculateIcon = " : ";

    String question = "none";
    if (calculation == "plus") {
      if (test % 2 == 0)
        result = (number1 + number2).toString();
      // right answer
      else
        result = (number1 + number2 + test).toString();
      // wrong answer
    } else if (calculation == "minus") {
      if (test % 2 == 0)
        result = (number1 - number2).toString();
      // right answer
      else
        result = (number1 - number2 + test).toString();
      // wrong answer
    } else if (calculation == "duplicate") {
      if (test % 2 == 0)
        result = (number1 * number2).toString();
      // right answer
      else
        result = (number1 * number2 + test).toString();
      // wrong answer
    } else if (calculation == "divide") {
      number1 = test * number2;
      if (test % 2 == 0)
        result = (number1 ~/ number2).toString();
      // right answer
      else
        result = (number1 ~/ number2 + test).toString();
      // wrong answer
      // ~/ is division return integer, / return double
    }
    question = number1.toString() +
        calculateIcon +
        number2.toString() +
        " =  " +
        result;
    //create question

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: GridView.count(
          childAspectRatio: (2.5 / 1),
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
                  alignment: Alignment(0.1, 1.2),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        child: Align(
                          alignment: Alignment(-0.5, 0),
                          child: Text("  " + trueAnswer.toString(),
                              style: TextStyle(fontSize: 70)),
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image:
                              AssetImage("images/Number of Right Answer.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Container(
                        width: 140,
                        height: 140,
                        child: Align(
                          alignment: Alignment(-0.5, 0),
                          child: Text(
                            "  " + falseAnswer.toString(),
                            style: TextStyle(fontSize: 70),
                          ),
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image:
                              AssetImage("images/Number of Wrong Answer.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Text(
                question,
                style: TextStyle(fontSize: 48),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: Image.asset(
                      "images/true-choice.png",
                      scale: 1.3,
                    ),
                    onTap: () {
                      checkAnswer(result, "true");
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    child: Image.asset(
                      "images/false-choice.png",
                      scale: 1.3,
                    ),
                    onTap: () {
                      checkAnswer(result, "false");
                    },
                  ),
                ),
              ],
            ),
            Image.asset(
              "images/thinking_boy.png",
            )
          ],
        ),
      ),
    );
  }
}
