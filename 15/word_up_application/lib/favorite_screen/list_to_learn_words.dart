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
            height: displayHeight(context)*0.7,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 1, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 2, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 3, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 4, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 5, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 6, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 7, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 8, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 8, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 8, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
              ],
            ),
          ),
        )
    );
  }
}