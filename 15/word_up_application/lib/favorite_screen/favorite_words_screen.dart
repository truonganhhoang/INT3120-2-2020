import 'package:assets_audio_player/assets_audio_player.dart';
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

DatabaseLocalHelper dbHelper = DatabaseLocalHelper.instance;
List<Word> wordsFarvorite = new List();
final assetsAudioPlayer = AssetsAudioPlayer();

class _FavoriteWordsScreenState extends State<FavoriteWordsScreen> {

  @override
  void initState() {
    super.initState();
    if (wordsFarvorite.length == 0) {
      dbHelper.getListFarvoriteWords().then((rows) {
        setState(() {
          rows.forEach((row) {
            wordsFarvorite.add(row);
          });
        });
      });
    }
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
                  alignment: Alignment.bottomCenter,
                  child: listWord(wordsFarvorite, Colors.blueAccent),
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
    height: 85 * SizeConfig.heightMultiplier,
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
                        isFavorite: true)
                  ],
                ),
              )
            ],
          );
        }),
  );
}
