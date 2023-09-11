import 'package:flutter/widgets.dart';

import '../../../theme/pellet.dart';

class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 19,
        color: Pellet.kGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
