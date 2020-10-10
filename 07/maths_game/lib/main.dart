import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'package:maths_game/SettingsScreen.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MathsApp());
}

class MathsApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  // This widget is the root of your application.
  static AudioCache player = AudioCache();
  playMusic() async {
    player.loop(
        'music/Dragon Ball Super Soundtrack Full _ Ultimate Battle - Akira Kushida Lyrics  Reupload.mp3',
        volume: 2.0);
  }

  // hàm này chuyển hướng sang GooglePlayScreen
  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  void _navigateToGameModeScreen(BuildContext context, String calculation) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new GameModeScreen(calculation)));
  }

  @override
  Widget build(BuildContext context) {
    playMusic();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: GridView.count(
          childAspectRatio: (1.6 / 1),
          crossAxisSpacing: 2,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          // GridView này chia mỗi hàng làm 2 grid - chưa được 2 widget với tỉ lệ rộng/dài của mỗi Grid là 1.6/1
          // khoảng cách chiều dọc của 2 grid với nhau là 10, chiều ngang là 2
          children: [
            InkWell(
              onTap: () {
                StoreRedirect.redirect(
                    androidAppId:
                        "com.GamesForKids.Mathgames.MultiplicationTables");
              },
              child: Image.asset(
                "images/app_list.png",
                scale: 1.3,
                alignment: Alignment(-0.9,-0.85),
              ),
            ),
            InkWell(
              onTap: () {
                _navigateToSettings(context);
              },
              child: Image.asset(
                "images/settings_icon.png",
                scale: 1.4,
                alignment: Alignment(0.9,-0.85),
              ),
              // Ảnh app_list được đặt trong một InkWell có hàm onTap(), khi Tap vào ảnh, sẽ gọi hàm _navigateToSettings
              // để chuyển sang màn hình Settings
            ),
            Text(""),
            Text(""),
            InkWell(
              child: Image.asset("images/plus_image.png",
                  alignment: Alignment(0.5,-1)),
              onTap: () {
                _navigateToGameModeScreen(context, "plus");
              },
            ),
            InkWell(
              child: Image.asset("images/minus_image.png",
                  alignment: Alignment(-0.5,-1)),
              onTap: () {
                _navigateToGameModeScreen(context, "minus");
              },
            ),
            InkWell(
              child: Image.asset("images/duplicate_image.png",
                  alignment: Alignment(0.5,-0.8)),
              onTap: () {
                _navigateToGameModeScreen(context, "duplicate");
              },
            ),
            InkWell(
              child: Image.asset("images/divide_image.png",
                  alignment: Alignment(-0.5,-0.8)),
              onTap: () {
                _navigateToGameModeScreen(context, "divide");
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
