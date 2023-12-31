import 'package:flutter/widgets.dart';

import '../../../constants/screen.dart';
import '../../../theme/pellet.dart';

/// [GreyPositionedCircleBorder] is a grey circle border positioned at the
/// bottom left of the welcome screen.
class GreyPositionedCircleBorder extends StatelessWidget {
  const GreyPositionedCircleBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return Positioned(
      bottom: height * -50,
      left: width * -50,
      child: Container(
        width: width * 100,
        height: height * 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(
              color: Pellet.kGrey.withOpacity(0.2),
              width: 60,
            ),
          ),
        ),
      ),
    );
  }
}
