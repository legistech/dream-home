import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Pellet.kDark.withOpacity(0.5),
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
