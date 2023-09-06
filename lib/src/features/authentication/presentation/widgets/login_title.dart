import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
