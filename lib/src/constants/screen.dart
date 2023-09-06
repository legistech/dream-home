import 'package:flutter/material.dart';

/// [ScreenSize] is used to get the screen size in percentage.
/// call static methods [ScreenSize.width], [ScreenSize.height] inside the
/// build method of any widget to get corresponding [width] and [height].
class ScreenSize {
  /// Returns the [width] of the screen in percentage.
  static double width(BuildContext context) =>
      MediaQuery.sizeOf(context).width / 100;

  ///Returns the [height] of the screen in percentage.
  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height / 100;
}
