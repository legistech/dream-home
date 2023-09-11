import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CreateProperty extends StatelessWidget {
  const CreateProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
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
        ),
        body: Column(),
        // bottomNavigationBar: BottomAppBar(
        //   child: CommonElevatedButton(text: 'Next'),
        // ),
      ),
    );
  }
}
