import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:word_up_application/components/common_components.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/study_home_screen/show_examples.dart';
import 'dart:async';
import '../app_manager.dart';
import '../size_config.dart';
import '../user.dart';
import '../word.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FavoriteWordsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWordsScreenState();
}

class _FavoriteWordsScreenState extends State<FavoriteWordsScreen> {
  DatabaseLocalHelper dbHelper = DatabaseLocalHelper.instance;
  List<Word> wordsFarvorite = new List();
  bool isLoadList = true;
  @override
  void initState() {
    super.initState();

    if (wordsFarvorite.length == 0) {
      dbHelper.getListFavoriteWords().then((rows) {
        setState(() {
          rows.forEach((row) {
            wordsFarvorite.add(row);
          });
        });
      }).then((value) async => {
            await Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                this.isLoadList = false;
              });
            })
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
                  child: (isLoadList)
                      ? loading()
                      : listWord(wordsFarvorite, Colors.blue[400]),
                )
              ],
            ),
          )),
    );
  }
}

Widget listWord(List<Word> words, Color colorText) {
  final assetsAudioPlayer = AssetsAudioPlayer();
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
                child: MaterialButton(
                  onPressed: () {
                    showDetailsOfWord(context, position, words);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0 * widthMultiplier),
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
                                  fontSize: 3 * SizeConfig.heightMultiplier,
                                  color: Colors.grey[700]))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2 * SizeConfig.widthMultiplier),
                        child: StarFavorite(
                            wordId: words[position].id,
                            size: 4 * SizeConfig.heightMultiplier,
                            isFavorite: words[position].isFavorite),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
  );
}

 Widget loading() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15 * SizeConfig.heightMultiplier),
        child: CircularProgressIndicator(
          //backgroundColor: Colors.yellowAccent,
        ))
    );
  }

void showDetailsOfWord(context, position, words) {
  final assetsAudioPlayer = AssetsAudioPlayer();
  var alertStyle = AlertStyle(
    alertElevation: 0,
    alertPadding: EdgeInsets.only(
        left: 3 * SizeConfig.heightMultiplier,
        right: 3 * SizeConfig.heightMultiplier,
        top: 0 * SizeConfig.widthMultiplier,
        bottom: 25 * SizeConfig.widthMultiplier),
    animationType: AnimationType.fromRight,
    isCloseButton: true,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle:
        TextStyle(color: Colors.red, fontSize: 3 * SizeConfig.heightMultiplier),
    alertAlignment: Alignment.center,
  );

  Alert(
      closeIcon: Icon(
        Icons.close,
      ),
      context: context,
      type: AlertType.none,
      title: 'Details',
      style: alertStyle,
      content: Container(
        height: 56 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('#' + '${words[position].id}',
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontStyle: FontStyle.italic)),
                Text('${words[position].word}',
                    style: TextStyle(
                        fontSize: 3.5 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold)),
                Text('${words[position].type}',
                    style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontStyle: FontStyle.italic)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () => {
                      assetsAudioPlayer.open(
                          Audio('assets/audios/${words[position].pathSoundUK}'))
                    },
                    icon: ImageIcon(
                      AssetImage('assets/sprites/sound_play_icon.png'),
                      size: 3.5 * SizeConfig.heightMultiplier,
                      color: Colors.grey,
                    ),
                  ),
                  Text('${words[position].pronounceUK}',
                      style: TextStyle(
                          fontSize: 2.5 * SizeConfig.textMultiplier,
                          fontStyle: FontStyle.italic)),
                  StarFavorite(
                      wordId: words[position].id,
                      size: 3 * SizeConfig.heightMultiplier,
                      isFavorite: words[position].isFavorite)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0 * SizeConfig.heightMultiplier),
              width: 40 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                //border: Border.all(color: Colors.grey)
              ),
              child: Center(
                child: Text('${words[position].meanCard}',
                    style:
                        TextStyle(fontSize: 2.5 * SizeConfig.textMultiplier)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
              child: Text('${words[position].definition}',
                  style: TextStyle(fontSize: 2.5 * SizeConfig.textMultiplier)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 0 * SizeConfig.heightMultiplier),
                child: Image.asset(
                    'assets/images/' + words[position].imagePaths[0]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
              child: Text(
                '${words[position].examples[0]}',
                style: TextStyle(fontSize: 2.5 * SizeConfig.textMultiplier),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
              child: Text(
                '"' + '${words[position].quotes[0]}' + '"',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 2 * SizeConfig.textMultiplier),
              ),
            ),
          ],
        ),
      ),
      buttons: []).show();
}
