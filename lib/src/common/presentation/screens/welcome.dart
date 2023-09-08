import 'package:dream_home/src/common/presentation/views/cyan_circle_positioned.dart';
import 'package:dream_home/src/common/presentation/views/grey_circle_positioned.dart';
import 'package:dream_home/src/common/presentation/widgets/description_title.dart';
import 'package:dream_home/src/common/presentation/widgets/elevated_button.dart';
import 'package:dream_home/src/common/presentation/widgets/welcome_description.dart';
import 'package:dream_home/src/common/presentation/widgets/welcome_image.dart';
import 'package:dream_home/src/common/presentation/widgets/welcome_title.dart';
import 'package:dream_home/src/constants/assets.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

/// [WelcomeScreen] is the screen where the user lands when they open the app
/// if they are not logged in already.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);

    return Scaffold(
      backgroundColor: Pellet.kWhite,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const GreyPositionedCircleBorder(),
          const CyanPositionedCircle(),
          SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WelcomeImage(Asset.welcome),
                SizedBox(height: height * 6),
                const WelcomeTitle('Discover Your World of Possibilities'),
                const WelcomeDescription('Embark on a journey to find your'),
                const DescriptionTitle('DreamHome'),
                const Spacer(),
                CommonElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    text: 'Get Started'),
                SizedBox(height: height * 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
