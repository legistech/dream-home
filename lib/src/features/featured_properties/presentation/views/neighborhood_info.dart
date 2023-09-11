import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../widgets/info_icon.dart';

class NeighborhoodDistanceView extends StatelessWidget {
  const NeighborhoodDistanceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoIcon(
          title: 'School',
          asset: Asset.schoolIcon,
          subtitle: '${1.2} km',
        ),
        InfoIcon(
          title: 'Hospital',
          asset: Asset.hospitalIcon,
          subtitle: '${1.2} km',
        ),
        InfoIcon(
          title: 'Hotel',
          asset: Asset.hotelIcon,
          subtitle: '${1.2} km',
        ),
      ],
    );
  }
}
