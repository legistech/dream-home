import 'package:flutter/material.dart';

class OptionsTitle extends StatelessWidget {
  const OptionsTitle(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
