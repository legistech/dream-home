import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../theme/pellet.dart';

class AppBarView extends StatelessWidget {
  final String currentLocation;

  const AppBarView({
    Key? key,
    required this.currentLocation, // Add this parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(IconlyBold.location),
        const SizedBox(width: 8),
        Text(
          currentLocation, // Use the currentLocation parameter here
          style: TextStyle(
            color: Pellet.kDark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(child: const Icon(IconlyLight.notification)),
      ],
    );
  }
}
