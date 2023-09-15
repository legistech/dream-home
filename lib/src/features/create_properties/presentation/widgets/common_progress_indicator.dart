import 'package:flutter/material.dart';

class CommonProgressIndicator extends StatelessWidget {
  final double indicatorValue;
  const CommonProgressIndicator({
    required this.indicatorValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: indicatorValue,
      minHeight: 5,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF004267)),
      backgroundColor: Colors.white,
    );
  }
}
