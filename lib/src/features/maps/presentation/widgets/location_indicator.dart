import 'package:flutter/material.dart';

class LocationIndicator extends StatelessWidget {
  const LocationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(
              color: Colors.white,
              width: 2,
            )),
      ),
    );
  }
}
