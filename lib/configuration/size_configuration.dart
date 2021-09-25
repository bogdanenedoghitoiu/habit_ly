import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation screenOrientation;

  void init(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    screenOrientation = _mediaQueryData.orientation;
    defaultSize = screenOrientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}