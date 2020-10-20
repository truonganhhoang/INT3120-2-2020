import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:word_up_application/selection_screen/word_selection_bar.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/word.dart';

class SelectionScreen extends StatefulWidget {
  final List<Word> listWordToSelect = [
    new Word(id: 1, word: 'dog', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 2, word: 'cat', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 3, word: 'bear', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 4, word: 'pig'),
    new Word(id: 5, word: 'bee')
  ];

  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  int index;
  int numberWords ;
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    numberWords = widget.listWordToSelect.length;
    return Scaffold(
      appBar: AppBar(
        title: Text((index + 1).toString() + '/' + numberWords.toString()),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: HexColor('#F7F7F5'),
      body: Card(
        shadowColor: Colors.black54,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 50),
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(
                      widget.listWordToSelect[index].word,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 5 * SizeConfig.heightMultiplier,
                          color: Colors.red),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(widget.listWordToSelect[index].pronounceUK,
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.heightMultiplier
                        ),)
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black12,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ImageIcon(
                      AssetImage('assets/sprites/sound_play_icon.png'),
                      color: Colors.black87,
                      size: 8 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                  child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I know',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 3 * SizeConfig.heightMultiplier,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'the meaning of ',
                              style: TextStyle(fontSize: 1.8 * SizeConfig.heightMultiplier, color: Colors.black,
                                  fontWeight: FontWeight.w300),
                              children: <TextSpan>[
                                TextSpan(text: widget.listWordToSelect[index].word, style: TextStyle(
                                    fontStyle: FontStyle.italic
                                )),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    userIsUnSure();
                  },
                  child: Container(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.center,
                      width: 400,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Un sure',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 3 * SizeConfig.heightMultiplier,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'the meaning of ',
                              style: TextStyle(fontSize: 1.8 * SizeConfig.heightMultiplier, color: Colors.black,
                              fontWeight: FontWeight.w300),
                              children: <TextSpan>[
                                TextSpan(text: widget.listWordToSelect[index].word, style: TextStyle(
                                  fontStyle: FontStyle.italic
                                )),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text(
                  'Skip Remaining ' + (numberWords - index).toString() + ' words.',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void userIsUnSure(){
    setState(() {
      index++;
    });
  }
}
