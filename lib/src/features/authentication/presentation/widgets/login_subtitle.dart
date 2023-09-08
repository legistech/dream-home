import 'package:flutter/material.dart';

/// [AuthSubtitle] is the subtitle of the login and register pages.
class AuthSubtitle extends StatelessWidget {
  const AuthSubtitle(
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
