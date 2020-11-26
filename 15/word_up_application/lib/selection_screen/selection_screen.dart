import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/selection_screen/finish_selection_screen.dart';
import 'package:word_up_application/selection_screen/word_selection_bar.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/word.dart';

class SelectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<Word> listWordToSelect = new List<Word>();
  List<String> listTestDefinition = new List(4);
  int numberWordNotKnow = 0;
  final assetsAudioPlayer = AssetsAudioPlayer();
  int index;
  int numberWords;
  bool isTesting;
  bool waitingForNotification;
  int correctIndex = 1;
  int chosenIndex;

  Future<void> _getData(int number) async {
    listWordToSelect = await DatabaseLocalHelper.instance.getNWords(number);
  }

  @override
  void initState() {
    waitingForNotification = false;
    chosenIndex = 0;
    index = 0;
    isTesting = false;
    _getData(5).then((value) => {
          setState(() {
            index = 0;
          })
        });
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    numberWords = listWordToSelect.length;
    if (index >= numberWords) index--;
    if (index < 0)
      return Container(
        color: Colors.white,
        child: _loading(),
      );

    return isTesting
        ? _testScreen(listWordToSelect[index])
        : Scaffold(
            appBar: AppBar(
              title:
                  Text((index + 1).toString() + '/' + numberWords.toString()),
              centerTitle: true,
              actions: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
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
                            listWordToSelect[index].word,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 5 * SizeConfig.heightMultiplier,
                                color: Colors.red),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                listWordToSelect[index].pronounceUK,
                                style: TextStyle(
                                    fontSize: 2 * SizeConfig.heightMultiplier),
                              )),
                        ],
                      ),
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        assetsAudioPlayer.open(
                          Audio('assets/audios/' +
                              listWordToSelect[index].pathSoundUK),
                        );
                      },
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
                          if (!waitingForNotification)
                            loadTest();
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
                                          text: listWordToSelect[index].word,
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
                          if (!waitingForNotification) userIsUnSure();
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
                                          text: listWordToSelect[index].word,
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

  void finishSelect() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FinishSelectionScreen(n: numberWordNotKnow)),
    );
  }

  Widget _testScreen(Word word) {
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: () {
              if (!waitingForNotification)
                setState(() {
                  isTesting = false;
                });
            },
            child: Icon(Icons.close, color: Colors.white,),
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
                    padding: EdgeInsets.symmetric(vertical: 20),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: _answerBox(1),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: _answerBox(2),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: _answerBox(3),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: _answerBox(4),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> spawnAnswers(Word w) async{
    listTestDefinition[correctIndex - 1] = w.definition;
    int numberWords = await DatabaseLocalHelper.instance.getCount();

    int id1 = Random().nextInt(numberWords);
    while(id1 == w.id)  id1 = Random().nextInt(numberWords);
    int id2 = Random().nextInt(numberWords);
    while(id2 == w.id || id2 == id1) id2 = Random().nextInt(numberWords);
    int id3 = Random().nextInt(numberWords);
    while(id3 == w.id || id3 == id1 ||id3 == id2) id3 = Random().nextInt(numberWords);

    List<String> ops = new List<String>();
    String w1 = await DatabaseLocalHelper.instance.getDefinitionWithId(id1);
    ops.add(w1);
    String w2 = await DatabaseLocalHelper.instance.getDefinitionWithId(id2);
    ops.add(w2);
    String w3 = await DatabaseLocalHelper.instance.getDefinitionWithId(id3);
    ops.add(w3);

    int x = 0;
    for(int i = 0; i < 4; i ++){
      if(i == correctIndex - 1) continue;
      listTestDefinition[i] = ops[x];
      x++;
    }
  }

  void loadTest() async{
    correctIndex = Random().nextInt(4) + 1;
    await spawnAnswers(listWordToSelect[index]);
    setState(() {
      isTesting = true;
      chosenIndex = 0;
    });
  }
  Widget _answerBox(int index) {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () {
        if (chosenIndex > 0) return;
        _checkTheAnswer(index);
        setState(() {
          chosenIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
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
                      color: (chosenIndex == index)
                          ? ((chosenIndex == correctIndex)
                              ? Colors.green
                              : Colors.red)
                          : Colors.blue,
                      border: Border()),
                  padding: EdgeInsets.all(10),
                  width: 50,
                  child: Text(
                    (() {
                      switch (index) {
                        case 1:
                          return 'A';
                        case 2:
                          return 'B';
                        case 3:
                          return 'C';
                        case 4:
                          return 'D';
                      }
                      return 'E';
                    })(),
                    style: TextStyle(
                      fontSize: 2.5 * SizeConfig.heightMultiplier,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding:
                      EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
                  child: Text(
                    listTestDefinition[index - 1],
                    style: TextStyle(
                        fontSize: 2 * SizeConfig.heightMultiplier,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void userIsUnSure() async {
    waitingForNotification = true;
    _showUnSureNotification();
    await Future.delayed(const Duration(milliseconds: 1000));
    numberWordNotKnow++;
    DatabaseLocalHelper.instance.insertToLearnWord(listWordToSelect[index].id);
    if (index == numberWords - 1) {
      await Future.delayed(const Duration(milliseconds: 1000));
      finishSelect();
    }
    else {
      setState(() {
        isTesting = false;
        waitingForNotification = false;
        index++;
      });
    }
  }

  void _showUnSureNotification() {
    EdgeAlert.show(context,
        icon: Icons.book,
        backgroundColor: Colors.deepOrange,
        title: listWordToSelect[index].word,
        description: 'Learn this word',
        gravity: EdgeAlert.BOTTOM,
        duration: 0);
  }

  void _userKnewThisWord() async{
    waitingForNotification = true;
    _showKnewNotification();
    DatabaseLocalHelper.instance.insertKnewWord(listWordToSelect[index].id);
    if (index == numberWords - 1) {
      await Future.delayed(const Duration(milliseconds: 1000));
      finishSelect();
    } else {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          waitingForNotification = false;
          isTesting = false;
          index++;
        });
      });
    }
  }

  void _showKnewNotification(){
    EdgeAlert.show(context,
        icon: Icons.book,
        backgroundColor: Colors.green,
        title: listWordToSelect[index].word,
        description: 'You know this word',
        gravity: EdgeAlert.BOTTOM,
        duration: 0);
  }

  void _checkTheAnswer(int index) {
    if (index == correctIndex) {
      _userKnewThisWord();
    } else {
      userIsUnSure();
    }
  }

  Widget _loading() {
    return Center(
      child: Container(
       // margin: EdgeInsets.only(bottom: 15 * SizeConfig.heightMultiplier),
        child: LoadingBouncingGrid.square(
          size: 8 * SizeConfig.heightMultiplier,
          backgroundColor: Colors.blue,
          inverted: true,
        ),
      ),
    );
  }
}
