import 'package:flutter/widgets.dart';

import '../../../constants/assets.dart';
import '../../../constants/screen.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage(
    this.asset, {
    super.key,
  });

  final String asset;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.asset(
        Asset.welcome,
        fit: BoxFit.cover,
        height: height * 55,
      ),
    );
  }
}
