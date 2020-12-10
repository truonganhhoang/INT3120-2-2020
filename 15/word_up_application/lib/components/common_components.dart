import 'package:flutter/material.dart';

class CommonComponents {
  static BoxDecoration background = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.0, -1.0),
      end: Alignment(0.0, 0.9999999999999998),
      stops: [0.0, 0.5104166865348816, 1.0],
      colors: [
        Color.fromARGB(255, 52, 206, 255),
        Color.fromARGB(255, 138, 206, 255),
        Color.fromARGB(255, 243, 254, 255)
      ],
    ),
  );
  static AssetImage bgFishTankGame =  new AssetImage("assets/sprites/ocean_background.jpg");
}
