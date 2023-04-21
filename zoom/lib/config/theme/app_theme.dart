import 'package:flutter/material.dart';
import 'package:zoom/utils/constants/app_colors.dart';

final appTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: appAccentColor,
    focusColor: appAccentColor,
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appAccentColor)),
      // enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appAccentColor)),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: errorAccentColor)),
      focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: errorAccentColor)),
    ));
