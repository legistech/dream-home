import 'package:flutter/material.dart';

/// [AuthTitle] is the Title of the login and register pages.
class AuthTitle extends StatelessWidget {
  const AuthTitle(
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
