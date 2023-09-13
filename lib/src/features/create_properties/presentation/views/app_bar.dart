import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.headset_mic,
            color: Colors.black,
          ),
          label: const Text(
            'help',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
