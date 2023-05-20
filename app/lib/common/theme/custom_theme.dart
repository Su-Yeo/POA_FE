import 'package:app/common/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

// 색상 선택
mode(ThemeMode mode) {
  return mode == ThemeMode.light
      ? lightColorScheme.primary
      : darkColorScheme.primary;
}

var lightThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
  colorScheme: lightColorScheme,
  primaryColor: lightColorScheme.primary,
  hoverColor: darkColorScheme.primary,
  hintColor: lightColorScheme.outlineVariant,
);
var darkThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
  colorScheme: darkColorScheme,
  primaryColor: darkColorScheme.primary,
  hoverColor: lightColorScheme.primary,
  hintColor: darkColorScheme.outlineVariant,
);

// 개별 Input Theme
var darkInputTheme = InputDecoration(
  focusColor: lightColorScheme.tertiary,
  iconColor: lightColorScheme.primary,
  fillColor: lightColorScheme.surfaceVariant,
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    // color: lightColorScheme.secondary,
    fontSize: 13.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primary,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
);

var lightInputTheme = InputDecoration(
  focusColor: darkColorScheme.tertiary,
  iconColor: darkColorScheme.primary,
  fillColor: darkColorScheme.surfaceVariant,
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    // color: darkColorScheme.secondary,
    fontSize: 13.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primary,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
);
