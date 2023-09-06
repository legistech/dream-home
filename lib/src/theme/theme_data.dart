import 'package:dream_home/src/theme/elevated_button.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

/// call [getThemeData] getter to get the material app theme data.
ThemeData getThemeData() => ThemeData(
      fontFamily: 'Satoshi',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Pellet.kDark,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonTheme(),
      ),
    );
