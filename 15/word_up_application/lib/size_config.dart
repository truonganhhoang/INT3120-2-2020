import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier;
  static double heightMultiplier = 10;
  static double widthMultiplier;
  static double edgeRatio;

  void init(BoxConstraints constraints, Orientation orientation){
    if(orientation == Orientation.portrait){
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
    edgeRatio = _screenHeight / _screenWidth;

    print('width: ' + widthMultiplier.toString());
    print(heightMultiplier);
  }
}