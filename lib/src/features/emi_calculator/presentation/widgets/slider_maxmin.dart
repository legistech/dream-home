import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final TextStyle style;

  const CommonText({
    super.key,
    required this.text,
    this.padding = EdgeInsets.zero,
    this.style = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 74, 74, 74),
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
