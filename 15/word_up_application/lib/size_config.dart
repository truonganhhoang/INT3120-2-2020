import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier;
  static double heightMultiplier = 10;
  static double widthMultiplier;
  static double edgeRatio;

  void init(BoxConstraints constraints, Orientation orientation){
    if(orientation == Orientation.portrait){
      screenHeight = constraints.maxHeight;
      screenWidth = constraints.maxWidth;
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
    }

    _blockSizeHorizontal = screenWidth / 100;
    _blockSizeVertical = screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
    edgeRatio = screenHeight / screenWidth;

    print('width: ' + widthMultiplier.toString());
    print(heightMultiplier);
  }
}