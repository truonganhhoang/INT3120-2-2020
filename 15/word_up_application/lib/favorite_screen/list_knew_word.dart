import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/components/star_favorite.dart';

import '../size_config.dart';
import '../word.dart';

class ListKnewWords extends StatefulWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  List<Word> words = new List();
  Color colorText;

  ListKnewWords({this.words, this.colorText});

  @override
  _ListKnewWordsState createState() => _ListKnewWordsState();
}

class _ListKnewWordsState extends State<ListKnewWords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: 4 * SizeConfig.widthMultiplier,
          left: 4 * SizeConfig.widthMultiplier),
      height: 78 * SizeConfig.heightMultiplier,
      child: ListView.builder(
          itemCount: widget.words.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, position) {
            var widthMultiplier = SizeConfig.widthMultiplier;
            return Column(
              children: <Widget>[
                Divider(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: 0.6 * SizeConfig.heightMultiplier),
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
                            widget.assetsAudioPlayer.open(Audio(
                                'assets/audios/${widget.words[position].pathSoundUK}'))
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
                            '${widget.words[position].word}',
                            style: TextStyle(
                                fontSize: 4 * SizeConfig.heightMultiplier,
                                color: widget.colorText),
                          ),
                          Text('${widget.words[position].pronounceUK}',
                              style: TextStyle(
                                  fontSize: 3 * SizeConfig.heightMultiplier))
                        ],
                      ),
                      StarFavorite(
                          wordId: widget.words[position].id,
                          size: 4 * SizeConfig.heightMultiplier,
                          isFavorite: widget.words[position].isFavorite)
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
