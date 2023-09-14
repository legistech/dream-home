import 'package:flutter/material.dart';

class CommonRow extends StatelessWidget {
  final String leftText;
  final String rightText;

  const CommonRow
({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            leftText,
            style: const TextStyle(),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            rightText,
            style: const TextStyle(),
          ),
        ),
      ],
    );
  }
}
