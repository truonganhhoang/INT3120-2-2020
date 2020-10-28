import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'dart:async';
import '../size_config.dart';
import '../word.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'list_knew_word.dart';

class ListWordsScreen extends StatefulWidget {
  int viewIndex;
  List<Word> wordsToLearn = new List();
  List<Word> wordsKnew = new List();
  List<Word> wordsLearning = new List();

  ListWordsScreen({Key key, @required this.viewIndex}) : super(key: key);

  set setIndexView(int _index) {
    viewIndex = _index;
  }

  // int get getIndexView => viewIndex;

  @override
  State<StatefulWidget> createState() => _ListWordsScreenState();
}

DatabaseLocalHelper dbHelper = DatabaseLocalHelper.instance;

class _ListWordsScreenState extends State<ListWordsScreen> {
  int colorIndex = 0;

  void _onChanged(int index) {
    setState(() {
      if (index == 0) {
        widget.setIndexView = 0;
        colorIndex = 0;
      } else if (index == 1) {
        widget.setIndexView = 1;
        colorIndex = 1;
      } else {
        widget.setIndexView = 2;
        colorIndex = 2;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.viewIndex == 0) colorIndex = 0;
    if (widget.viewIndex == 1) colorIndex = 1;
    if (widget.viewIndex == 2) colorIndex = 2;
    if (widget.wordsToLearn.length == 0) {
      dbHelper.getListToLearnWords().then((rows) {
        setState(() {
          rows.forEach((row) {
            widget.wordsToLearn.add(row);
          });
        });
      });
    }

    if (widget.wordsKnew.length == 0) {
      dbHelper.getListKnewWords().then((rows) {
        setState(() {
          rows.forEach((row) {
            widget.wordsKnew.add(row);
          });
        });
      });
    }

    if (widget.wordsLearning.length == 0) {
      dbHelper.getListLearningWords().then((rows) {
        setState(() {
          rows.forEach((row) {
            widget.wordsLearning.add(row);
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Words'),
        centerTitle: true,
      ),
      body: Container(
          decoration: CommonComponents.background,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                    child: ToggleSwitch(
                      initialLabelIndex: widget.viewIndex,
                      minWidth: 80 * SizeConfig.widthMultiplier,
                      minHeight: 6 * SizeConfig.heightMultiplier,
                      cornerRadius: 20,
                      activeBgColor: Colors.white,
                      inactiveBgColor: Colors.grey[300],
                      activeFgColor: (colorIndex == 0)
                          ? Color(0xFF0FA830)
                          : ((colorIndex == 1)
                              ? Color(0xFFEEAB00)
                              : Color(0xFFFF180A)),
                      inactiveFgColor: Colors.grey[600],
                      labels: ['Knew', 'Learning', 'To learn'],
                      icons: [
                        FontAwesomeIcons.check,
                        FontAwesomeIcons.accusoft,
                        FontAwesomeIcons.question
                      ],
                      onToggle: (index) {
                        print('switched to: $index');
                        _onChanged(index);
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: (widget.viewIndex == 0)
                      ? ListKnewWords(
                          words: widget.wordsKnew,
                          colorText: Color(0xFF0FA830),
                        )
                      : ((widget.viewIndex == 1)
                          ? ListKnewWords(
                              words: widget.wordsLearning,
                              colorText: Color(0xFFEEAB00))
                          : ListKnewWords(
                              words: widget.wordsToLearn,
                              colorText: Color(0xFFFF180A))),
                )
              ],
            ),
          )),
    );
  }
}

Widget listKnewWord(List<Word> words, Color colorText) {
  final assetsAudioPlayer = AssetsAudioPlayer();
  return Container(
    padding: EdgeInsets.only(
        right: 4 * SizeConfig.widthMultiplier,
        left: 4 * SizeConfig.widthMultiplier),
    height: 78 * SizeConfig.heightMultiplier,
    child: ListView.builder(
        itemCount: words.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          var widthMultiplier = SizeConfig.widthMultiplier;
          return Column(
            children: <Widget>[
              Divider(
                height: 5,
              ),
              Container(
                padding:
                    EdgeInsets.only(bottom: 0.6 * SizeConfig.heightMultiplier),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 3 * widthMultiplier),
                      child: IconButton(
                        onPressed: () => {
                          assetsAudioPlayer.open(Audio(
                              'assets/audios/${words[position].pathSoundUK}'))
                        },
                        icon: ImageIcon(
                          AssetImage('assets/sprites/sound_play_icon.png'),
                          size: 4.5 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '${words[position].word}',
                          style: TextStyle(
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              color: colorText),
                        ),
                        Text('${words[position].pronounceUK}',
                            style: TextStyle(
                                fontSize: 3 * SizeConfig.heightMultiplier))
                      ],
                    ),
                    StarFavorite(
                        wordId: words[position].id,
                        size: 4 * SizeConfig.heightMultiplier,
                        isFavorite: words[position].isFavorite)
                  ],
                ),
              )
            ],
          );
        }),
  );
}

Widget listToLearnWord(List<Word> words, Color colorText) {
  final assetsAudioPlayer = AssetsAudioPlayer();
  return Container(
    padding: EdgeInsets.only(
        right: 4 * SizeConfig.widthMultiplier,
        left: 4 * SizeConfig.widthMultiplier),
    height: 78 * SizeConfig.heightMultiplier,
    child: ListView.builder(
        itemCount: words.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          var widthMultiplier = SizeConfig.widthMultiplier;
          return Column(
            children: <Widget>[
              Divider(
                height: 5,
              ),
              Container(
                padding:
                    EdgeInsets.only(bottom: 0.6 * SizeConfig.heightMultiplier),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 3 * widthMultiplier),
                      child: IconButton(
                        onPressed: () => {
                          assetsAudioPlayer.open(Audio(
                              'assets/audios/${words[position].pathSoundUK}'))
                        },
                        icon: ImageIcon(
                          AssetImage('assets/sprites/sound_play_icon.png'),
                          size: 4.5 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '${words[position].word}',
                          style: TextStyle(
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              color: colorText),
                        ),
                        Text('${words[position].pronounceUK}',
                            style: TextStyle(
                                fontSize: 3 * SizeConfig.heightMultiplier))
                      ],
                    ),
                    StarFavorite(
                        wordId: words[position].id,
                        size: 4 * SizeConfig.heightMultiplier,
                        isFavorite: words[position].isFavorite)
                  ],
                ),
              )
            ],
          );
        }),
  );
}

Widget listLearningWord(List<Word> words, Color colorText) {
  final assetsAudioPlayer = AssetsAudioPlayer();
  return Container(
    padding: EdgeInsets.only(
        right: 4 * SizeConfig.widthMultiplier,
        left: 4 * SizeConfig.widthMultiplier),
    height: 78 * SizeConfig.heightMultiplier,
    child: ListView.builder(
        itemCount: words.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          var widthMultiplier = SizeConfig.widthMultiplier;
          return Column(
            children: <Widget>[
              Divider(
                height: 5,
              ),
              Container(
                padding:
                    EdgeInsets.only(bottom: 0.6 * SizeConfig.heightMultiplier),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 3 * widthMultiplier),
                      child: IconButton(
                        onPressed: () => {
                          assetsAudioPlayer.open(Audio(
                              'assets/audios/${words[position].pathSoundUK}'))
                        },
                        icon: ImageIcon(
                          AssetImage('assets/sprites/sound_play_icon.png'),
                          size: 4.5 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '${words[position].word}',
                          style: TextStyle(
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              color: colorText),
                        ),
                        Text('${words[position].pronounceUK}',
                            style: TextStyle(
                                fontSize: 3 * SizeConfig.heightMultiplier))
                      ],
                    ),
                    StarFavorite(
                        wordId: words[position].id,
                        size: 4 * SizeConfig.heightMultiplier,
                        isFavorite: words[position].isFavorite)
                  ],
                ),
              )
            ],
          );
        }),
  );
}
