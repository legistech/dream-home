import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../theme/pellet.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(IconlyBold.location),
        const SizedBox(width: 8),
        Text(
          'Pune',
          style: TextStyle(
            color: Pellet.kDark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Badge(
            child: Icon(IconlyLight.notification),
          ),
        ),
      ],
    );
  }
}
