import 'package:flutter/material.dart';

class PlayGameScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Text('Play Game',style: TextStyle(fontSize: 30),),
      ),
      backgroundColor: Colors.greenAccent,
    );
  }

}