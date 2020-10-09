import 'package:flutter/cupertino.dart';
import 'package:word_up_application/favorite_screen/size_helper.dart';

import '../size_config.dart';
import '../word.dart';
import 'box_word.dart';

class ListToLearnWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ListToLearnWords();
}

class _ListToLearnWords extends State<ListToLearnWords>{
  @override
  Widget build(BuildContext context) {
    return(
        Container(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 70 * SizeConfig.heightMultiplier,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                BoxWord(word: new Word(id: 1, word: 'hello', pronounUK: '/heˈləʊ/'),),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounUK: '/heˈləʊ/'),),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounUK: '/heˈləʊ/'),),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounUK: '/heˈləʊ/'),),
              ],
            ),
          ),
        )
    );
  }
}