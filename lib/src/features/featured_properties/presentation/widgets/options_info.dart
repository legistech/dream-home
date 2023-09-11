import 'package:flutter/material.dart';

class OptionsInfo extends StatelessWidget {
  const OptionsInfo({
    super.key,
    required this.data,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;
  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${data[0].toInt()} $leading',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '${data[1].toInt()} $trailing',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
