import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CommonFeaturedChoiceChip extends StatelessWidget {
  const CommonFeaturedChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final width = ScreenSize.width(context);
    return ChoiceChip(
      label: Text(text),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: width * 5, vertical: 8),
      selectedColor: Pellet.kPrimaryColor,
      disabledColor: Pellet.kWhite,
      labelStyle: TextStyle(
        color: isSelected ? Pellet.kWhite : Pellet.kDark,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }
}
