import 'package:flutter/material.dart';

class Vocabulary extends StatelessWidget {
  final String word;

  Vocabulary({this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Color(0xff9079A5),
            borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          child: Center(
            child: Text(
              word,
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}