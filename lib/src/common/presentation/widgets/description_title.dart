import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/widgets.dart';


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
