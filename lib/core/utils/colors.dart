

import 'package:flutter/material.dart';

abstract class ThemeColors {
  static const Color lighterBlue = Color(0xFF1b9aaa);
  static const Color lightBlue = Color(0xFF146c94);
  static const Color darkBlue = Color(0xFF0f4c75);
  static const Color darkerBlue= Color(0xFF0b3954);
  static const Color white = Color(0xFFf5f5f5);
  static const Color ultraWhite = Color(0xFFffffff);
  static const Color dark = Color(0xFF272727);
  static const Color black = Color(0xFF19191a);
  static const Color error = Color(0xFFFF9800);
  static const Color errorLight = Color(0xFFFFA726);
  static const Color errorRed = Color(0xFFD32F2F);
  static const MaterialColor primary = MaterialColor(
    0xFF146c94,
    <int, Color>{
      50: Color(0xFFe0f4f8),
      100: Color(0xFFb3e0ed),
      200: Color(0xFF80cbe1),
      300: Color(0xFF4db6d6),
      400: Color(0xFF26a6ce),
      500: Color(0xFF0096c6),
      600: Color(0xFF008dc0),
      700: Color(0xFF0082b9),
      800: Color(0xFF0078b2),
      900: Color(0xFF0065a6),
    },
  );

}