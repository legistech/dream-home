import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';


/// [elevatedButtonTheme] contains the default theme for the elevated button.
ButtonStyle elevatedButtonTheme() {
  return ElevatedButton.styleFrom(
    foregroundColor: Pellet.kWhite,
    backgroundColor: Pellet.kPrimaryColor,
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
