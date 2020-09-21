import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  bool _isLoaded;
  double width;
  double height;
  Header({Key key, this.width, this.height}) : super(key: key);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  double left, right = 0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        left = widget.width * 0.5;
        right = widget.width * 0.5;
      });
    });

    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new AnimatedContainer(
            duration: Duration(seconds: 2),
            color: Colors.red,
            width: left,
            height: 200,
          ),
          new AnimatedContainer(
            duration: Duration(seconds: 2),
            color: Colors.blue,
            width: right,
            height: 200,
          )
        ],
      ),
    );
  }
}
