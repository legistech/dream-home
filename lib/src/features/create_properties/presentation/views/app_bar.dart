<<<<<<< HEAD
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
            'Help',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
=======
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
>>>>>>> 34c70049b3fea1666a9966f35806fcddf92596eb
