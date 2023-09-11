import 'package:flutter/material.dart';

import '../../../../constants/screen.dart';
import '../../../../theme/pellet.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    this.onTap,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.text,
  });

  final Function()? onTap;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 5,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Pellet.kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: Pellet.kWhite,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Pellet.kWhite),
            ),
            const Spacer(),
            Icon(
              trailingIcon,
              color: Pellet.kWhite,
            )
          ],
        ),
      ),
    );
  }
}
