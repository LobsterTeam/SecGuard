import 'package:flutter/material.dart';

class ThemeColors {
  const ThemeColors();

  static const Color redViolet = const Color(0xff922b3e);
  static const Color lightRedViolet = const Color(0xaf922b3e);
  static const Color redCard = const Color(0xffff0000);
  static const Color orangeCard = const Color(0xffffa500);
  static const Color yellowOrangeCard = const Color(0xffffae42);
  static const Color yellowCard = const Color(0xffffff00);
  static const Color yellowGreenCard = const Color(0xff9acd32);
  static const Color GreenCard = const Color(0xff008000);
}

class ThemeTextStyles {
  const ThemeTextStyles();

  static const TextStyle appBarTitle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 30.0
  );

  static const TextStyle homeCardTitle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 20.0
  );

  static const TextStyle rowKey = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 16.0
  );

  static const TextStyle rowValue = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16.0
  );

  static const TextStyle homeButtonTitle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 18.0
  );
}
