import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static final Map<String, Color> _typleColorMap = {
    "Grass": Colors.green,
    "Fire": Colors.redAccent,
    "Water": Colors.blue,
    "Electric": Colors.yellow,
    "Rock": Colors.grey,
    "Ground": Colors.brown,
    "Bug": Colors.lightGreen.shade700,
    "Psychic": Colors.indigo,
    "Fighting": Colors.orange,
    "Ghost": Colors.deepPurple,
    "Normal": Colors.black26,
    "Poison": Colors.deepPurpleAccent,
  };

  static Color getColorFromType(String type) {
    if (_typleColorMap.containsKey(type)) {
      return _typleColorMap[type] ?? Colors.red.shade300;
    }
    return Colors.pink.shade300;
  }

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding() {
    return ScreenUtil().orientation == Orientation.portrait
        ? EdgeInsets.all(12.h)
        : EdgeInsets.all(8.w);
  }

  static int setGrid() =>
      ScreenUtil().orientation == Orientation.portrait ? 2 : 3;

  static double calculatePokeImageAndBallSize() =>
      ScreenUtil().orientation == Orientation.portrait ? 0.2.sw : 0.24.sh;
}
