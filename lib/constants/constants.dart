import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static TextStyle pokeInfoLabelTextStyle = TextStyle(
      fontSize: _calculateFontSize(20),
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static TextStyle pokeInfoTextStyle =
      TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);

  Constants._();
  static const String title = "Pokedex";
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  static TextStyle pokemonNameTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: _calculateFontSize(24),
  );
  static TextStyle typeChipTextStyle = TextStyle(
    color: Colors.white,
    fontSize: _calculateFontSize(18),
  );
  static const String titleImage = "assets/images/pokeball.png";
  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.5).sp;
    }
  }
}
