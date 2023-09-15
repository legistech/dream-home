import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String titletext;
  const CommonText({
    required this.titletext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titletext,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
