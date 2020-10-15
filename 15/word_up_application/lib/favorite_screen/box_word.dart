import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/size_config.dart';

import '../word.dart';

class BoxWord extends StatefulWidget {
  final Word word;
  final Color colorWordInBox;

  const BoxWord({Key key, this.word, this.colorWordInBox}) : super(key: key);

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
              padding: EdgeInsets.all(15),
              child: ImageIcon(
                AssetImage('assets/sprites/sound_play_icon.png'), 
                size: 4.5*SizeConfig.heightMultiplier,
                color: Colors.grey,)),
          Column(
            children: [
              Text(widget.word.word,
                style: TextStyle(fontSize: 3*SizeConfig.heightMultiplier, color: widget.colorWordInBox),),
              Text(widget.word.pronounceUK, style: TextStyle(fontSize: 2.5*SizeConfig.heightMultiplier),),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: StarFavorite(wordId: null, size: 4*SizeConfig.heightMultiplier, isFavorite: true)
          )
        ],
      ),
    );
  }
}