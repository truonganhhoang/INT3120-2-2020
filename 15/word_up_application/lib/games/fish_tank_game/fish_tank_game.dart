import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:word_up_application/size_config.dart';

import 'my_fish.dart';

class FishTankGame extends StatefulWidget {
  final String title = "xx";

  @override
  _FishTankGameState createState() => _FishTankGameState();
}

class _FishTankGameState extends State<FishTankGame> {
  List<double> waveValues = [0,0, 0,0];
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

  MaskFilter _blur;
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

  @override
  Widget build(BuildContext context) {
    //print('xx');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 10.0,
        backgroundColor: Colors.blueGrey[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(_blur == null ? Icons.blur_off : Icons.blur_on),
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

  void startGame(){
    posX = 0;
    posY = -1;
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
            child: MyFish(directionMoveRight: isMoveToRight,),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/sprites/ocean_floor.png",
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.green,
                  onPressed: (){
                    statusAnswer = true;
                    transferQuestion();
                  },
                  child: Container(
                    child: Text('Correct'),
                  ),
                ),
                FlatButton(
                  color: Colors.green,
                  onPressed: (){
                    statusAnswer = false;
                    transferQuestion();
                  },
                  child: Container(
                    child: Text('Incorrect'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void transferQuestion(){
    transfer = true;
  }

  void waterHeightAnimation() {
    if (wave >= 0.9 && isDown == true) {
      speedWave = -0.001;
      isDown = false;
    }
    if (wave <= 0 && isDown == false) {
      speedWave = 0.001;
      isDown = true;
    }

    if(transfer){
      isDown = false;
      if(wave <= 0) {
        speedWave = 0;
        if(statusAnswer == true){
          transfer = false;
        }
      }
      else {
          speedWave = -0.01;
      }
    }

    wave += speedWave;

    _moveFish();

    for (int i = 0; i < 4; i++) {
      waveValues[i] = wave + offsetWave[i];
    }
    Timer.periodic(
      Duration(milliseconds: 60),
      (Timer t) => {
        setState(() {}),
      },
    );
  }

  void _moveFish(){
    if(isMoveToRight){
      if(posX > 0.9){
        isMoveToRight = false;
        speedFish = -speedFish;
      }
    }
    else {
      if(posX < -0.9){
        isMoveToRight = true;
        speedFish = -speedFish;
      }
    }
    posX += speedFish;
    posY += speedWave * 2.1;
  }
}
