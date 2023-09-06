import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        SizedBox(width: 10),
        Text('or'),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
