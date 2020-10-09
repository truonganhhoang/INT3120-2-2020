import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/favorite_screen/size_helper.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/size_config.dart';

import '../word.dart';
import 'box_word.dart';

class ListKnewWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ListKnewWords();
}

class _ListKnewWords extends State<ListKnewWords> {
  // DatabaseHelper dbHelper = DatabaseHelper.instance;
  // List<Word> words = new List();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   dbHelper.getAllWord().then((rows){
  //     setState(() {
  //       rows.forEach((row) {
  //         words.add(Word.map(row));
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return
      // ListView.builder(
      //   itemCount: words.length,
      //   padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      //   scrollDirection: Axis.vertical,
      //   itemBuilder: (context, position){
      //     return Column(
      //       children: <Widget>[
      //         Divider(height: 5,),
      //         Material(
      //           child: ListTile(
      //             title: Text('${words[position].id}', style: TextStyle(fontSize: 23, color: Colors.green)),
      //             subtitle: Text('${words[position].pronounUK}', style: TextStyle(fontSize: 23)),
      //             trailing: Icon(Icons.volume_up),
      //             leading: Icon(Icons.star),
      //           ),
      //         )
      //       ],
      //     );
      //   },

      Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(bottom: 0),
        padding: EdgeInsets.all(10),
        height: 70 * SizeConfig.heightMultiplier,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            BoxWord(word: new Word(
                id: 1, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
            BoxWord(word: new Word(
                id: 1, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
            BoxWord(word: new Word(
                id: 1, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
            BoxWord(word: new Word(
                id: 1, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
            BoxWord(word: new Word(
                id: 1, word: 'goodbye', pronounUK: '/ɡʊdˈbaɪ/'),),
          ],
        ),
      );
  }
}