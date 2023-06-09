import 'package:flutter/material.dart';

const primaryColor = Color(0xff000000);
const lineColor = Color(0xff8e8e93);
const bgColor = Color(0xfff5f5f5);

var customThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
  primaryColor: primaryColor,
  textTheme: customTextTheme,
);

var customInputTheme = const InputDecoration(
  isCollapsed: true,
  contentPadding: EdgeInsets.all(16.0),
  errorMaxLines: 1,
  fillColor: bgColor,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lineColor,
      width: 1.0,
    ),
  ),
);

var customTextTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w800,
  ),
  headlineSmall: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  ),
  displayLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
  displayMedium: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  ),
  displaySmall: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
  ),
  labelSmall: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w200,
  ),
);
