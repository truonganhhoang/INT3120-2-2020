import 'package:flutter/material.dart';

class TestQuestionScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TestQuestionScreen();
}

class _TestQuestionScreen extends State<TestQuestionScreen>{
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.all(50),
     decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.all(Radius.circular(15)),
     ),
   );
  }
}