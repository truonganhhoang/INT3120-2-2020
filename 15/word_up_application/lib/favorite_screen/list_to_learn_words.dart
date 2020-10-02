import 'package:flutter/cupertino.dart';

import '../word.dart';
import 'box_word.dart';

class ListToLearnWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ListToLearnWords();
}

class _ListToLearnWords extends State<ListToLearnWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return(
        Padding(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Container(
            height: 522,
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
                  child: BoxWord(word: new Word(id: 9, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 10, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 11, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 12, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 13, word: 'hello', pronounUK: '/heˈləʊ/'),),
                ),
              ],
            ),
          ),
        )
    );
  }
}