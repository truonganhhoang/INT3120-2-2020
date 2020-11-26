import 'package:bucha_app/constants.dart';
import 'package:bucha_app/main.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int score;

  ScorePage({this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        children: [
          SizedBox(
            height: height(context) * 0.02,
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/victory.jpg'),
                  ),
                  Container(
                    child: Text(
                      "VICTORY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: height(context) * 0.1,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  "ĐIỂM CỦA BẠN : " + score.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height(context)*0.15,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  HomePage()));
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
