import 'package:flutter/material.dart';
import 'package:word_up_application/word.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/components/star_favorite.dart';

class LearnBox extends StatelessWidget {
  final Word word;
  final assetsAudioPlayer = AssetsAudioPlayer();
  LearnBox({this.word});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.only(top: 15.0, left: 15, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
              width: 32 * SizeConfig.heightMultiplier,
              height: 60 * SizeConfig.heightMultiplier,
              margin: EdgeInsets.fromLTRB(10, 00, 10, 0),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          word.type,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.6 * SizeConfig.textMultiplier,
                          ),
                        ),
                        StarFavorite(wordId: word.id,size: 3.2 * SizeConfig.heightMultiplier,isFavorite: false,)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        word.word,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.5 * SizeConfig.textMultiplier,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 25 * SizeConfig.heightMultiplier,
                    height: 30,
                    margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
                    padding:
                        EdgeInsets.only(left: 6.8 * SizeConfig.textMultiplier),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          word.pronounUK,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.2 * SizeConfig.textMultiplier,
                          ),
                        ),
                        IconButton(
                          onPressed: () => (assetsAudioPlayer.open(
                            Audio(word.pathSoundUK),
                          )),
                          color: Colors.blueGrey,
                          //padding: EdgeInsets.all(10.0),
                          icon: Icon(
                            Icons.volume_up,
                            color: Colors.blue,
                            size: 2.2 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
                    child: Text(
                      word.definition,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 2 * SizeConfig.textMultiplier,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 10 * SizeConfig.heightMultiplier,
                    margin:
                        EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                    child: Column(
                      children: [
                        Text(
                          word.example1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 2 * SizeConfig.textMultiplier,
                          ),
                        ),
                        Text(
                          word.example2,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 2 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 15 * SizeConfig.heightMultiplier,
                    height: 30,
                    margin:
                        EdgeInsets.only(top: 1.5 * SizeConfig.heightMultiplier),
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          word.mean,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 2.5 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 2.4 * SizeConfig.textMultiplier),
                    width: 27 * SizeConfig.heightMultiplier,
                    height: 14 * SizeConfig.heightMultiplier,
                    child: Image(image: AssetImage(word.pathImage)),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
