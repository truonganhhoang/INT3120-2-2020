import 'dart:async';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:word_up_application/local_database/database_local_helper.dart';
import 'package:word_up_application/size_config.dart';

import '../../word.dart';
import 'death_screen.dart';
import 'my_fish.dart';

class FishTankGame extends StatefulWidget {
  final int numberWords = 30;
  final String title = "xx";
  final assetsAudioPlayer = AssetsAudioPlayer();
  final assetsMusicPlayer = AssetsAudioPlayer();

  @override
  _FishTankGameState createState() => _FishTankGameState();
}

class _FishTankGameState extends State<FishTankGame> {
  List<double> waveValues = [0, 0, 0, 0];
  List<double> offsetWave = [0.05, 0, 0.03, 0.02];
  double wave = 0;
  double speedWave = 0.001;
  bool isDown = true;
  double posX = 0;
  double posY = -0.6;
  bool isMoveToRight = true;
  double speedFish = 0.008;
  bool transfer = false;
  bool statusAnswer = false;
  List<Word> listWords = new List<Word>();
  bool isLoaded;
  int currentIndex = 0;
  int answerCorrect = 0;
  String valueAnswerNotCorrect;
  int score;
  bool fishIsDeath;
  double increaseOffset;
  int bestScore = 0;
  SharedPreferences prefs;
  MaskFilter _blur;
  Timer timer;

  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;

  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  Future<void> _readData() async {
    prefs = await SharedPreferences.getInstance();
    bestScore = prefs.getInt('bestScore');
    if (bestScore == null) bestScore = 0;
    if (bestScore == null) bestScore = 0;
    listWords =
        await DatabaseLocalHelper.instance.getWordsForGame(widget.numberWords);
  }

  @override
  void initState() {
    score = 0;
    answerCorrect = 0;
    isLoaded = false;
    _readData().then((value) => {
          startGame(),
          setState(() {
            isLoaded = true;
          }),
        });
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Center(
        child: _loading(),
      );
    }
    //print('xx');
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'Score: ' + score.toString() + " ",
            style: TextStyle(
              fontSize: 2.5 * SizeConfig.heightMultiplier,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Best: ' + bestScore.toString(),
                style: TextStyle(
                  //  fontStyle: FontStyle.italic,
                  fontSize: 2.5 * SizeConfig.heightMultiplier,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _blur == null ? Icons.blur_off : Icons.blur_on,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _blur = _nextBlur();
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildGame(),
          ],
        ),
      ),
    );
  }

  void startGame() {
    timer = Timer.periodic(
      Duration(milliseconds: 60),
          (Timer t) => {
        if (fishIsDeath) t.cancel(),
        setState(() {}),
      },
    );
    widget.assetsMusicPlayer.open(
        Audio('assets/audios_games/music_fish_tank.mp3'),
        loopMode: LoopMode.playlist);
    increaseOffset = 0;
    statusAnswer = true;
    fishIsDeath = false;
    currentIndex = Random().nextInt(widget.numberWords);
    posX = 0;
    posY = -0.6;
    nextQuestion();
  }

  Widget _buildGame() {
    waterHeightAnimation();
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight / 10 * 1.1 * SizeConfig.heightMultiplier,
      child: Stack(
        children: [
          WaveWidget(
            waveFrequency: 1.6,
            config: CustomConfig(
              gradients: [
                [Colors.lightBlueAccent, HexColor('#DEDFFF')],
                [Colors.blue[800], HexColor('#BDB3FF')],
                [HexColor('#BAFAFB'), HexColor('#BFDCFF')],
                [HexColor('#1F14BF'), Colors.lightBlueAccent]
              ],
              durations: [35000, 19440, 10800, 6000],
              heightPercentages: waveValues,
              blur: _blur,
              gradientBegin: Alignment.bottomCenter,
              gradientEnd: Alignment.topCenter,
            ),
            heightPercentange: 0.8,
            backgroundColor: Colors.white,
            size: Size(double.infinity, double.infinity),
            waveAmplitude: 0,
          ),
          AnimatedContainer(
            alignment: Alignment(posX, posY),
            duration: Duration(milliseconds: 0),
            child: MyFish(
              directionMoveRight: isMoveToRight,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/sprites/ocean_floor.png",
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.7),
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  listWords[currentIndex].definition,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 2.2 * SizeConfig.heightMultiplier,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10 * SizeConfig.heightMultiplier,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.green.withOpacity(0.8),
                  onPressed: () {
                    if (transfer) return;
                    if (answerCorrect == 0)
                      statusAnswer = true;
                    else
                      statusAnswer = false;
                    transferQuestion();
                  },
                  child: Container(
                    width: 20 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Center(
                      child: Text(
                        (answerCorrect == 0)
                            ? listWords[currentIndex].word
                            : valueAnswerNotCorrect,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.5 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.green.withOpacity(0.8),
                  onPressed: () {
                    if (transfer) return;
                    if (answerCorrect == 1)
                      statusAnswer = true;
                    else
                      statusAnswer = false;
                    transferQuestion();
                  },
                  child: Container(
                    width: 20 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Center(
                      child: Text(
                        (answerCorrect == 1)
                            ? listWords[currentIndex].word
                            : valueAnswerNotCorrect,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.5 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void transferQuestion() {
    transfer = true;
  }

  void waterHeightAnimation() {
    if (wave >= 0.9 && isDown == true) {
      speedWave = -0.03 - increaseOffset;
      isDown = false;
    }
    if (wave <= 0 && isDown == false) {
      speedWave = 0.001 + increaseOffset;
      isDown = true;
    }
    if (!statusAnswer) {
      fishDie();
    }

    if (transfer) {
      isDown = false;
      if (wave <= 0) {
        speedWave = 0;
        if (statusAnswer == true) {
          score++;
          if (score > bestScore) {
            bestScore = score;
            prefs.setInt("bestScore", bestScore);
          }
          increaseOffset += 0.00005;
          if (increaseOffset >= 0.008) increaseOffset -= 0.00005;
          nextQuestion();

          widget.assetsAudioPlayer
              .open(Audio('assets/audios_games/answer_correct.mp3'));
          transfer = false;
        }
      } else {
        speedWave = -0.03 - increaseOffset;
      }
    }
    wave += speedWave;

    if (wave > 0.8) {
      fishDie();
      transfer = true;
    }
    if (fishIsDeath) return;

    _moveFish();

    for (int i = 0; i < 4; i++) {
      waveValues[i] = wave + offsetWave[i];
    }
  }

  void fishDie() {
    widget.assetsAudioPlayer
        .open(Audio('assets/audios_games/answer_wrong.wav'));
    fishIsDeath = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      widget.assetsMusicPlayer.stop();
      Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: DeathScreen(
              score: score,
            ),
          ));
    });
  }

  void nextQuestion() {
    int x = currentIndex;
    currentIndex = Random().nextInt(widget.numberWords);
    while (currentIndex == x) {
      currentIndex = Random().nextInt(widget.numberWords);
    }
    answerCorrect = Random().nextInt(2);

    int v = Random().nextInt(widget.numberWords);
    while (currentIndex == v) {
      v = Random().nextInt(widget.numberWords);
    }
    valueAnswerNotCorrect = listWords[v].word;
  }

  void _moveFish() {
    if (isMoveToRight) {
      if (posX > 0.9) {
        isMoveToRight = false;
        speedFish = -speedFish;
      }
    } else {
      if (posX < -0.9) {
        isMoveToRight = true;
        speedFish = -speedFish;
      }
    }
    posX += speedFish;
    posY += speedWave * 2.1;
  }

  Widget _loading() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15 * SizeConfig.heightMultiplier),
        child: LoadingBouncingGrid.square(
          size: 6 * SizeConfig.heightMultiplier,
          backgroundColor: Colors.blue,
          inverted: true,
        ),
      ),
    );
  }
}
