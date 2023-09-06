import 'package:flutter/material.dart';

class NavigationQuery extends StatelessWidget {
  const NavigationQuery({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title '),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
