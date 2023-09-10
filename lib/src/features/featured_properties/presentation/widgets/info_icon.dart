import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({
    super.key,
    required this.title,
    required this.asset,
    required this.subtitle,
  });

  final String title;
  final String asset;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          asset,
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        )
      ],
    );
  }
}
