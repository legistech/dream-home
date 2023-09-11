import 'package:flutter/material.dart';

import '../../../../theme/pellet.dart';

/// [SheetTitle] contains the title of bottom sheet.
class SheetTitle extends StatelessWidget {
  const SheetTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DragHandle extends StatelessWidget {
  const DragHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: Pellet.kWhite,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
