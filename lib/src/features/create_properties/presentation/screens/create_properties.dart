import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CreatePropertyScreen extends StatelessWidget {
  const CreatePropertyScreen({super.key});

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('step 1 of 1'),
            )
          ],
        ),
        // bottomNavigationBar: BottomAppBar(
        //   child: CommonElevatedButton(text: 'Next'),
        // ),
      ),
    );
  }
}
