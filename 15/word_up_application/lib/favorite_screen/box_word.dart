import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

import '../word.dart';

class BoxWord extends StatefulWidget {
  final Word word;

  const BoxWord({Key key, this.word}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoxWord();
}

class _BoxWord extends State<BoxWord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      //padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.volume_up, size: 5 * SizeConfig.heightMultiplier,
                color: Colors.grey,)),
          Column(
            children: [
              Text(widget.word.word,
                style: TextStyle(fontSize: 23, color: Colors.green),),
              Text(widget.word.pronounceUK, style: TextStyle(fontSize: 20),),
            ],
          ),
          Icon(Icons.star, color: Colors.yellow, size: 30,)
        ],
      ),
    );
  }
}