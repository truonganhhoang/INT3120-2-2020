import 'package:flutter/material.dart';

class MyFish extends StatelessWidget {
  final bool directionMoveRight;

  MyFish({
    this.directionMoveRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Image.asset(
    (directionMoveRight) ? "assets/sprites/fish_swim.gif" :
    "assets/sprites/fish_swim_left.gif",
      ),
    );
  }
}