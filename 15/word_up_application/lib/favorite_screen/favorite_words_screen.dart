import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/favorite_screen/box_word.dart';
import 'package:word_up_application/favorite_screen/list_knew_words.dart';
import 'package:word_up_application/favorite_screen/list_to_learn_words.dart';

import '../word.dart';

class FavoriteWordsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWordsScreenState();
}

class _FavoriteWordsScreenState extends State<FavoriteWordsScreen> {
  bool viewListWords = false;
  bool pressed = false;

  void _onChanged(bool value) {
    setState(() {
      viewListWords = value;
      pressed = !pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 0.9999999999999998),
                stops: [0.0, 0.5104166865348816, 1.0],
                colors: [
                  Color.fromARGB(255, 52, 206, 255),
                  Color.fromARGB(255, 138, 206, 255),
                  Color.fromARGB(255, 243, 254, 255)
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                          color: pressed ? Colors.grey[300] : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
                          )
                        ),
                        child: MaterialButton(
                          child: Text('To learn', style: pressed ? TextStyle(color: Colors.grey[600]) : TextStyle(color: Colors.green),),
                          onPressed: (){
                            _onChanged(false);
                          },
                        ),
                      ),
                      Container(
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                          color: pressed ? Colors.white : Colors.grey[300],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)
                            )
                        ),
                        child: MaterialButton(
                          child: Text('Knew', style: pressed ? TextStyle(color: Colors.green) : TextStyle(color: Colors.grey[600]),),
                          onPressed: (){
                            _onChanged(true);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                viewListWords ? ListKnewWords() : ListToLearnWords(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
