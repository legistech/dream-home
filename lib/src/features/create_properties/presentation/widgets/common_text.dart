import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String titleText;
  const CommonText({
    required this.titleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
