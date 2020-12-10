import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WordSelectionBar extends StatefulWidget {
  final String word;
  WordSelectionBar({@required this.word});

  @override
  State<StatefulWidget> createState() => _WordSelectionBarStage();
}

class _WordSelectionBarStage extends State<WordSelectionBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
     // alignment: Alignment.center,
      height: 80,
      width: 200,
      child: Card(
        child: Text(
          widget.word,
          textAlign: TextAlign.center,
        ),
        color: HexColor('#d6d1cd'),
      ),
    );
  }
}
