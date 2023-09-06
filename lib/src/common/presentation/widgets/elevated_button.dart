import 'package:dream_home/src/constants/screen.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(
            width * 90,
            height * 6,
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
