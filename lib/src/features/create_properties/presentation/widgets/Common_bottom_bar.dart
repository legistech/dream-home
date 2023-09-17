import 'package:dream_home/src/features/user_profile/presentation/widgets/profile_button.dart';
import 'package:flutter/material.dart';

class CommonBottomBar extends StatelessWidget {
  final icon;
  final String buttonText;
  final ontap;
  const CommonBottomBar({
    required this.icon,
    required this.buttonText,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ProfileButton(icon: icon, text: buttonText, onPressed: ontap),
      ),
    );
  }
}
