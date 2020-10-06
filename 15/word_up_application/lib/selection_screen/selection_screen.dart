import 'package:flutter/material.dart';

import '../word.dart';

class SelectionScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen>{
  @override
  final Word w1 = Word(id: 1,word: 'dog');
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}