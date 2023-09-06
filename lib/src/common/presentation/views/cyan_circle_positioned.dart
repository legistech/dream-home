import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/widgets.dart';

class CyanPositionedCircle extends StatelessWidget {
  const CyanPositionedCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return Positioned(
      top: height * 50,
      left: width * 80,
      child: Container(
        width: width * 40,
        height: height * 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Pellet.kSecondaryColor,
        ),
      ),
    );
  }
}
