import 'package:flutter/material.dart';

/// [NavigationQuery] asks whether user already has an account or not
/// to navigate between login and register pages.
class NavigationQuery extends StatelessWidget {
  const NavigationQuery({
    super.key,
    required this.title,
    required this.text,
    this.onTap,
  });

  final String title;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title '),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
