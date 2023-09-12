import 'package:flutter/material.dart';

/// [Pellet] class is used to store all the colors used in the app.
/// use static [Pellet] getter to get the instance of [Pellet]
class Pellet {
  static Color get kPrimaryColor => const Color(0xFF004267);
  static Color get kSecondaryColor => const Color(0xFFC0E8FF);
  static Color get kDarkTextColor => const Color(0xFF004267);
  static Color get kLightTextColor => const Color(0xFF004267);
  static Color get kWhite => const Color(0xFFFFFFFF);
  static Color get kDark => const Color(0xff3e3a3a);
  static Color get kGrey => const Color(0xFF808080);

  /// [kBackgroundGradient] is used to set the background gradient for the app.
  static Gradient get kBackgroundGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFA0C9ED),
          kWhite,
        ],
      );
}
