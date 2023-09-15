import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: const Scaffold(
        body: Center(),
      ),
    );
  }
}
