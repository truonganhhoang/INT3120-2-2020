import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  double width;
  double height;
  Header({Key key, this.width, this.height}) : super(key: key);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool firstRun = true;
  double left, right = 0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        left = widget.width * 0.5;
        right = widget.width * 0.5;
        // firstRun = false;
      });
    });

    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: firstRun
            ? <Widget>[
                new AnimatedContainer(
                  duration: Duration(seconds: 2),
                  constraints: BoxConstraints(maxWidth: left),
                  color: Colors.red,
                  width: left,
                  height: 200,
                ),
                new AnimatedContainer(
                  duration: Duration(seconds: 2),
                  constraints: BoxConstraints(
                      maxWidth: widget.width * 0.5, maxHeight: widget.height),
                  color: Colors.blue,
                  width: right,
                  height: 200,
                )
              ]
            : <Widget>[
                new Container(
                  color: Colors.red,
                  width: left,
                  height: 200,
                ),
                new Container(
                  color: Colors.blue,
                  width: right,
                  height: 200,
                )
              ],
      ),
    );
  }
}
