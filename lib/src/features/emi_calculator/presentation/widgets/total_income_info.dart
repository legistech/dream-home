import 'package:flutter/material.dart';

class CommonStyledText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final TextStyle style;

  const CommonStyledText({
    super.key,
    required this.text,
    this.padding = EdgeInsets.zero,
    this.style = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
