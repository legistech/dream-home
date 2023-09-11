import 'package:flutter/material.dart';

import '../../../../theme/pellet.dart';

/// [SocialButton] is used in both login and register pages.
/// It is used to login or register using third party apps.
class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.asset,
    required this.text,
    required this.onPressed,
  });
  final String asset;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Pellet.kWhite,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Pellet.kDark,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(200, 50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 10),
          Text(
            'Continue with $text',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
