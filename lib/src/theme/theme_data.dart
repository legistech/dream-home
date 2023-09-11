import 'package:flutter/material.dart';

import 'elevated_button.dart';
import 'pellet.dart';

/// call [getThemeData] getter to get the material app theme data.
ThemeData getThemeData() => ThemeData(
      fontFamily: 'Satoshi',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Pellet.kDark,
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: Pellet.kDark),
      scaffoldBackgroundColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonTheme(),
      ),
    );
