import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';
import '../word.dart';
import 'box_word.dart';

class ListToLearnWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ListToLearnWords();
}

class _ListToLearnWords extends State<ListToLearnWords> {
  @override
  Widget build(BuildContext context) {
    return (
        Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          height: 78 * SizeConfig.heightMultiplier,
          child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
                BoxWord(word: new Word(id: 1, word: 'hello', pronounceUK: '/heˈləʊ/'), colorWordInBox: Colors.red[300],),
              ],
          ),
        )
    );
  }
}