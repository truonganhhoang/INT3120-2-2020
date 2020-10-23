import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/selection_screen/finish_selection_screen.dart';
import 'package:word_up_application/selection_screen/word_selection_bar.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/word.dart';

class SelectionScreen extends StatefulWidget {
  final List<Word> listWordToSelect = [
    new Word(id: 1, word: 'dog', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 2, word: 'cat', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 3, word: 'bear', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 4, word: 'pig', pronounceUK: 'prəˈnaʊns'),
    new Word(id: 5, word: 'bee', pronounceUK: 'prəˈnaʊns')
  ];

  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  int index;
  int numberWords;
  bool isTesting;

  @override
  void initState() {
    index = 0;
    isTesting = false;
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    numberWords = widget.listWordToSelect.length;
    if (index >= numberWords) index--;
    return isTesting
        ? _testScreen(widget.listWordToSelect[index])
        : Scaffold(
            appBar: AppBar(
              title:
                  Text((index + 1).toString() + '/' + numberWords.toString()),
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
                              child: Text(
                                widget.listWordToSelect[index].pronounceUK,
                                style: TextStyle(
                                    fontSize: 2 * SizeConfig.heightMultiplier),
                              )),
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
                        onPressed: () {
                          setState(() {
                            isTesting = true;
                          });
                        },
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
                                    style: TextStyle(
                                        fontSize:
                                            1.8 * SizeConfig.heightMultiplier,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: widget
                                              .listWordToSelect[index].word,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic)),
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
                                    style: TextStyle(
                                        fontSize:
                                            1.8 * SizeConfig.heightMultiplier,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: widget
                                              .listWordToSelect[index].word,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic)),
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
                        'Skip Remaining ' +
                            (numberWords - index).toString() +
                            ' words.',
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

  void userIsUnSure() {
    if (index == numberWords - 1) {
      finishSelect();
    }
    setState(() {
      index++;
    });
  }

  void finishSelect() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FinishSelectionScreen()),
    );
  }

  Widget _testScreen(Word word) {
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: () {
              setState(() {
                isTesting = false;
              });
            },
            child: Icon(Icons.close),
          ),
        ),
        body: Card(
          shadowColor: Colors.black54,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 50),
          color: Colors.white,
          child: Container(
            child: Column(
              children: [
                Container(
                    child: RichText(
                  text: TextSpan(
                    text: word.word,
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.heightMultiplier,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' means ______________.',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                )),
                _answerBox(),
                SizedBox(
                  height: 10,
                ),
                _answerBox(),
                SizedBox(
                  height: 10,
                ),
                _answerBox(),
                SizedBox(
                  height: 10,
                ),
                _answerBox(),
              ],
            ),
          ),
        ));
  }

  Widget _answerBox() {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(10),
                  width: 50,
                  child: Text('A'),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text('provide money to pay(a cost or expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
