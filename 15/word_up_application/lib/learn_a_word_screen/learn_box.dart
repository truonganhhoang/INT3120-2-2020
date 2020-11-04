import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/word.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/components/star_favorite.dart';

class LearnBox extends StatelessWidget {
  final Word word;
  final int index;
  final assetsAudioPlayer = AssetsAudioPlayer();

  LearnBox({this.word, this.index}) : assert(word != null && index != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90 * SizeConfig.widthMultiplier,
      margin: EdgeInsets.only(top: 5.0, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
              width: 70 * SizeConfig.widthMultiplier,
              height: 66 * SizeConfig.heightMultiplier,
              padding: EdgeInsets.only(left: 6, right: 6),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 6, right: 0, top: SizeConfig.textMultiplier),
                    height: 6 * SizeConfig.textMultiplier,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          word.type.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 2.7 * SizeConfig.textMultiplier,
                          ),
                        ),
                        StarFavorite(
                          wordId: word.id,
                          size: 3.2 * SizeConfig.heightMultiplier,
                          isFavorite: word.isFavorite,
                        )
                      ],
                    ),
                  ),
                  Text(
                    word.word.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 3.6 * SizeConfig.textMultiplier,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45 * SizeConfig.widthMultiplier,
                        height: 4.6 * SizeConfig.textMultiplier,
                        margin: EdgeInsets.only(
                            left: 5 * SizeConfig.widthMultiplier),
                        padding: EdgeInsets.only(
                            top: 0.8 * SizeConfig.textMultiplier),
                        decoration: BoxDecoration(
                          color: Colors.yellow[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          word.pronounceUK.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.2 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ),
                      Container(
                        width: 5 * SizeConfig.widthMultiplier,
                        child: IconButton(
                          onPressed: () => (assetsAudioPlayer.open(
                            Audio('assets/audios/' + word.pathSoundUK),
                          )),
                          color: Colors.blueGrey,
                          //padding: EdgeInsets.all(10.0),
                          icon: Icon(
                            Icons.volume_up,
                            color: Colors.blue,
                            size: 3 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 0.8 * SizeConfig.widthMultiplier),
                    child: Text(
                      word.definition.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 2.1 * SizeConfig.textMultiplier,
                      ),
                    ),
                  ),
                  Container(
                    width: 62 * SizeConfig.widthMultiplier,
                    margin:
                        EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
                    child: Column(
                      children: [
                        Text(
                          "- " + word.examples[2 * index].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 2.1 * SizeConfig.textMultiplier,
                          ),
                        ),
                        Text(
                          "- " + word.examples[2 * index + 1].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 2.1 * SizeConfig.textMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40 * SizeConfig.widthMultiplier,
                    height: 5 * SizeConfig.textMultiplier,
                    margin:
                        EdgeInsets.only(top: 1.2 * SizeConfig.textMultiplier),
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          word.meanCard.toString(),
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
                    margin: EdgeInsets.only(top: 2 * SizeConfig.textMultiplier),
                    child: Image(
                        image: AssetImage(
                            'assets/images/' + word.imagePaths[index]),
                        width: 50 * SizeConfig.widthMultiplier,
                        height: 15 * SizeConfig.heightMultiplier,
                        fit: BoxFit.fill),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
