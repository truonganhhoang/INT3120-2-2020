import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/learn_a_word_screen/learn_a_word_screen.dart';
import 'package:word_up_application/study_home_screen/test_question_screen.dart';
import 'package:word_up_application/word.dart';

class WordBox extends StatefulWidget {
  final Word word;
  WordBox({
    @required this.word,
  }):assert(word != null);

  @override
  State<StatefulWidget> createState() => _WordBoxState();
}

class _WordBoxState extends State<WordBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {},
                child: Icon(Icons.star, size: 30, color: Colors.white,),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {},
                child: Icon(Icons.close, size: 30, color: Colors.white,),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              widget.word.word, style: TextStyle(color: Colors.white, fontSize: 40),),
          ),

          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              widget.word.pronounUK,
              style: TextStyle(color: Colors.white70, fontSize: 25),),
          ),

          Padding(
            padding: EdgeInsets.all(5),
            child: MaterialButton(
              onPressed: () {},
              child: ImageIcon(
                AssetImage('assets/sprites/sound_play_icon.png'),
                color: Colors.grey, size: 100,),
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('I know',
                        style: TextStyle(
                            color: Colors.white, fontSize: 17),),
                    ),
                    MaterialButton(
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LearnAWord()),
                        );
                      },
                      color: Colors.red,
                      minWidth: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.red)
                      ),
                      child: Text('Learn',
                        style: TextStyle(
                            color: Colors.white, fontSize: 17),),
                    ),
                    MaterialButton(
                      height: 50,
                      onPressed: () {
                        showDialog(context: context,
                        builder: (context){
                          return Dialog(
                           child: TestQuestionScreen(),
                          );
                        });
                      },
                      color: Colors.orange,
                      minWidth: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.orange)
                      ),
                      child: Text('Test ne',
                        style: TextStyle(
                            color: Colors.white, fontSize: 17),),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}