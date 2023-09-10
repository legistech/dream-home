import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/widgets.dart';

class FeaturedInfo extends StatelessWidget {
  const FeaturedInfo({
    super.key,
    required this.leading,
    required this.trailing,
    this.onTap,
  });
  final String leading;
  final String trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leading,
              style: TextStyle(
                color: Pellet.kDark,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              )),
          Text(
            trailing,
            style: TextStyle(
              color: Pellet.kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
