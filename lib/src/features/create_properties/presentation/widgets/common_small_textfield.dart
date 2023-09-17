import 'package:dream_home/src/constants/screen.dart';
import 'package:flutter/material.dart';

class CommonSmallTextfield extends StatelessWidget {
  const CommonSmallTextfield({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return SizedBox(
      height: height * 5,
      width: width * 42,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
