import 'package:flutter/material.dart';

import 'homePage.dart';

class OnThi extends StatefulWidget {
  @override
  _OnThiState createState() => _OnThiState();
}

class _OnThiState extends State<OnThi> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ôn Thi"),
      ),
    );
  }
}
