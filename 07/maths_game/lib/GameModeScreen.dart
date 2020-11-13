import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maths_game/TrueOrFalseScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_game/KienThucScreen.dart';
import 'package:maths_game/QuizScreen.dart';
import 'package:maths_game/TimeScreen.dart';

class GameModeScreen extends StatelessWidget {
  String calculation;

  void _navigateToKienThuc(BuildContext context, String calculation) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new KienThucScreen(calculation)));
  }

  void _navigateToTimeScreen(BuildContext context, String calculation) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new TimeScreen(calculation)));
  }

  void _navigateToTrueOrFalse(BuildContext context, String calculation) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new TrueOrFalseScreen(calculation)));
  }

  void _navigateToQuizScreen(BuildContext context, String calculation) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new QuizScreen(calculation)));
  }

  GameModeScreen(this.calculation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0),
          child: GridView.count(
            childAspectRatio: (1.7 / 1),
            crossAxisSpacing: 2,
            mainAxisSpacing: 46,
            crossAxisCount: 2,
            // GridView này chia mỗi hàng làm 2 grid - chưa được 2 widget với tỉ lệ rộng/dài của mỗi Grid là 1.6/1
            // khoảng cách chiều dọc của 2 grid với nhau là 10, chiều ngang là 2
            children: [
              Text(""),
              Text(""),
              InkWell(
                child: Image.asset("images/Frame 19.png",
                    alignment: Alignment(0.3,-0.5)),
                onTap: () {
                  _navigateToKienThuc(context, calculation);
                },
              ),
              InkWell(
                child: Image.asset("images/Frame 20.png",
                    alignment: Alignment(-0.3,-0.5)),
                onTap: () {
                  _navigateToQuizScreen(context, calculation);
                },
              ),
              InkWell(
                child: Image.asset("images/Frame 21.png",
                    alignment: Alignment(0.3,-1)),
                onTap: () {
                  _navigateToTrueOrFalse(context, calculation);
                },
              ),
              InkWell(
                child: Image.asset("images/Frame 22.png",
                    alignment: Alignment(-0.3,-1)),
                onTap: () {
                  _navigateToTimeScreen(context, calculation);
                },
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
