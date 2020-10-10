import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'package:maths_game/main.dart';

class ResultScreen extends StatelessWidget {
  String calculation;
  int finalScore;
  ResultScreen(this.calculation, this.finalScore);

  void _navigateToGameModeScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new GameModeScreen(calculation)));
  }

  void _navigateToMainScreen(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.count(
          childAspectRatio: 4.4 / 1,
          mainAxisSpacing: 40,
          crossAxisCount: 1,
          children: [
            Container(
              child: Align(
                alignment: Alignment(0, 0),
                child: Text(
                  "Your Scores",
                  style: TextStyle(fontSize: 38),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/Score title.png"),
                fit: BoxFit.contain,
              )),
            ),
            Container(
              child: Align(
                alignment: Alignment(0, 0),
                child: Text(
                  finalScore.toString(),
                  style: TextStyle(fontSize: 48),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/Scores.png"),
                fit: BoxFit.contain,
              )),
            ),
            Image.asset("images/result_line.png"),
            InkWell(
              child: Image.asset("images/Main menu.png"),
              onTap: () {
                _navigateToMainScreen(context);
              },
            ),
            InkWell(
              child: Image.asset("images/Play again.png"),
              onTap: () {
                _navigateToGameModeScreen(context);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/result_background.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
