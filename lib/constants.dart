import 'package:flutter/material.dart';

const Map<int, Color> color = {
  50: Color.fromRGBO(38, 108, 39, .1),
  100: Color.fromRGBO(38, 108, 39, .2),
  200: Color.fromRGBO(38, 108, 39, .3),
  300: Color.fromRGBO(38, 108, 39, .4),
  400: Color.fromRGBO(38, 108, 39, .5),
  500: Color.fromRGBO(38, 108, 39, .6),
  600: Color.fromRGBO(38, 108, 39, .7),
  700: Color.fromRGBO(38, 108, 39, .8),
  800: Color.fromRGBO(38, 108, 39, .9),
  900: Color.fromRGBO(38, 108, 39, 1),
};

MaterialColor customPrimarySwatch = const MaterialColor(0xFF2D9D2F, color);
const kNumberTextStyle = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.bold,
);
const kTriviaTextStyle = TextStyle(
  fontSize: 30,
);
