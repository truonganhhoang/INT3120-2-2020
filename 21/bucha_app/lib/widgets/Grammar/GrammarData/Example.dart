import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  final String name;
  final String meaning;

  Example({this.name, this.meaning});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.name,
            style: TextStyle(
              color: Colors.purple[200],
              fontSize: 16.0,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.meaning,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}