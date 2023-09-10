import 'package:flutter/material.dart';

class OptionsInfo extends StatelessWidget {
  const OptionsInfo({
    super.key,
    required this.data,
  });

  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$ ${data[0].toInt()}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$ ${data[1].toInt()}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
