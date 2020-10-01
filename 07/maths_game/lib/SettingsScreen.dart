import 'package:flutter/material.dart';
import 'package:volume/volume.dart';
import 'package:screen/screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Maths Game"),
      ),
      body: Container(
        child: SimpleDialog(
          backgroundColor: Colors.blueAccent,
          contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 0),
          title: Text('Settings', textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
          children: [
            Image.asset("images/Music line.png"),
            MyMusicSlider(),
            MyBrigtnessSlider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100,horizontal: 0),
            ),
          ],
        ),
        //cú pháp dưới đây để cài đặt background cho Screen
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/settings_background.png"),
              fit: BoxFit.fill,
            )
        ),
      ),
    );
  }
}

class MyMusicSlider extends StatefulWidget {
  MyMusicSlider({Key key}) : super(key: key);

  @override
  _MyMusicSlider createState() => _MyMusicSlider();
}

class _MyMusicSlider extends State<MyMusicSlider> {
  double _currentSliderValue ;
  int maxSliderValue;
  AudioManager audioManager;

  @override
  void initState() {
    super.initState();
    audioManager = AudioManager.STREAM_SYSTEM;
    initPlatformState(AudioManager.STREAM_MUSIC);
    updateVolumes();
  }
  // init first state

  Future<void> initPlatformState(AudioManager am) async {
    await Volume.controlVolume(am);
  }
  // create controlVolume for music

  void setVol(int i) async {
    await Volume.setVol(i);
  }
  // set Volume value

  void updateVolumes() async {
    // get Max Volume
    maxSliderValue = await Volume.getMaxVol;
    // get Current Volume
    _currentSliderValue = await Volume.getVol / 1;
    setState(() {});
  }
  //update Volume variable


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.asset("images/music.png",alignment: Alignment.topCenter,scale: 1.3),
          ],
        ),
        Column(
          children: [
            Text("Music",style: TextStyle(fontSize: 28)),
          ],
        ),
        (_currentSliderValue != null || maxSliderValue != null)
           ? Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
              value: _currentSliderValue,
              min: 0,
              max: maxSliderValue / 1.0,
              divisions: (maxSliderValue),
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setVol(value.toInt());
                updateVolumes();
              },
            ) : Column()
      ],
    );
  }
}

class MyBrigtnessSlider extends StatefulWidget {
  MyBrigtnessSlider({Key key}) : super(key: key);

  @override
  _MyBrightnessSlider createState() => _MyBrightnessSlider();
}

class _MyBrightnessSlider extends State<MyBrigtnessSlider> {
  double _brightness;
  //bool _isKeptOn = false;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    //_isKeptOn = await Screen.isKeptOn;
    _brightness = await Screen.brightness;
    setState((){
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.asset("images/brightness.png",alignment: Alignment.topCenter,scale: 1.4),
          ],
        ),
        Column(
          children: [
            Text("Brightness",style: TextStyle(fontSize: 20)),
          ],
        ),
        (_brightness != null)
        ? Slider(
          value: _brightness,
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
          min: 0,
          max: 1,
          divisions: 10,
          label: _brightness.toStringAsFixed(1),
          onChanged: (double value) {
              Screen.setBrightness(value);
              initPlatformState();
          },
        ) : Column()
      ],
    );
  }
}

