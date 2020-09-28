import 'package:flutter/material.dart';

class StudyHomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StudyHomeScreenState();
}

class _StudyHomeScreenState extends State<StudyHomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Center(
          child: Text('Study this word',style: TextStyle(fontSize: 30),),
        ),
      backgroundColor: Colors.lightGreen,
    );
  }
}