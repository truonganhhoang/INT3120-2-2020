import 'package:flutter/material.dart';

class Unit extends StatelessWidget{
  final String name;
  final Color color;
  final String set;

  Unit({this.name, this.color, this.set});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.0),
      width: 320.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: this.color,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 6.0),
        child: Text(
          this.name,
        ),
      ),
    );
  }
}