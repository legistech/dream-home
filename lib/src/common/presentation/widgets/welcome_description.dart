import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/widgets.dart';

class WelcomeDescription extends StatelessWidget {
  const WelcomeDescription(
    this.description, {
    super.key,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 19,
        color: Pellet.kGrey,
      ),
    );
  }
}
