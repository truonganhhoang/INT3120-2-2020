import 'package:flutter/cupertino.dart';

import '../word.dart';
import 'box_word.dart';

class ListKnewWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ListKnewWords();
}

class _ListKnewWords extends State<ListKnewWords>{
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
                  child: BoxWord(word: new Word(id: 1, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 2, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 3, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 4, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 5, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 6, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 7, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 8, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 9, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 10, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 11, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 12, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: BoxWord(word: new Word(id: 13, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
                ),
              ],
            ),
          ),
        )
    );
  }
}