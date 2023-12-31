import 'package:flutter/material.dart';

import '../../../constants/screen.dart';

/// [CommonElevatedButton] is a common button used in most
/// of the buttons in the app.
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
            height * 5,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: height * 2),
      ),
    );
  }
}
