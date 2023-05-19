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
