import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CommonDetailsTextfield extends StatelessWidget {
  const CommonDetailsTextfield({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        maxLength: 300,
        maxLines: 10,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Pellet.kPrimaryColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
