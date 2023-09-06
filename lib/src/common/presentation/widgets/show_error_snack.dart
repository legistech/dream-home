import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

/// Call [showErrorSnack] function inside scaffold's context to show error snack.
SnackBar showErrorSnack(String message) {
  return SnackBar(
    duration: Duration(seconds: message.length ~/ 10),
    behavior: SnackBarBehavior.floating,
    content: Center(
        child: Text(
      message,
      style: TextStyle(color: Pellet.kWhite, fontWeight: FontWeight.bold),
    )),
    backgroundColor: Colors.red,
  );
}
