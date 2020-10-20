import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'dart:async';
import '../size_config.dart';
import '../word.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FavoriteWordsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWordsScreenState();
}

DatabaseHelper dbHelper = DatabaseHelper.instance;
List<Word> wordsToLearn = new List();
List<Word> wordsKnew = new List();

class _FavoriteWordsScreenState extends State<FavoriteWordsScreen> {
  int viewIndex = 0;
  int colorIndex = 0;
  bool areListKnewWordGet = false;

  void _onChanged(int index) {
    setState(() {
      if (index == 0) {
        viewIndex = 0;
        colorIndex = 0;
      } else {
        viewIndex = 1;
        colorIndex = 1;
        if (!areListKnewWordGet) _getDataForListKnewWord();
      }
    });
  }

  // call only one
  _getDataForListKnewWord() {
    dbHelper.getListKnewWords().then((rows) {
      setState(() {
        rows.forEach((row) {
          wordsKnew.add(row);
        });
      });
    });
    areListKnewWordGet = true;
  }

  @override
  void initState() {
    super.initState();
    dbHelper.getListToLearnWords().then((rows) {
      setState(() {
        rows.forEach((row) {
          wordsToLearn.add(row);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      initialLabelIndex: viewIndex,
                      minWidth: 80 * SizeConfig.widthMultiplier,
                      minHeight: 6 * SizeConfig.heightMultiplier,
                      cornerRadius: 20,
                      activeBgColor: Colors.white,
                      activeFgColor:
                          (colorIndex == 0) ? Colors.red[300] : Colors.green,
                      inactiveBgColor: Colors.grey[300],
                      inactiveFgColor: Colors.grey[600],
                      labels: ['To learn', 'Knew'],
                      icons: [
                        FontAwesomeIcons.question,
                        FontAwesomeIcons.check
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
                  child: (viewIndex == 0)
                      ? listWord(wordsToLearn, Colors.red[300])
                      : listWord(wordsKnew, Colors.green[300]),
                )
              ],
            ),
          )),
    );
  }
}

Widget listWord(List<Word> words, Color colorText) {
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
                      padding: EdgeInsets.only(left: 5 * widthMultiplier),
                      child: ImageIcon(
                        AssetImage('assets/sprites/sound_play_icon.png'),
                        size: 4.5 * SizeConfig.heightMultiplier,
                        color: Colors.grey,
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
                        wordId: null,
                        size: 4 * SizeConfig.heightMultiplier,
                        isFavorite: true)
                  ],
                ),
              )
            ],
          );
        }),
  );
}
