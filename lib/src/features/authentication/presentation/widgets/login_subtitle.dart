import 'package:flutter/material.dart';

class LoginSubtitle extends StatelessWidget {
  const LoginSubtitle(
    this.subtitle, {
    super.key,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
