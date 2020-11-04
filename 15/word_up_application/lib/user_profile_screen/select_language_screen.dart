import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [],),
      body: Center(child: Text('test'),),
    );
  }
}