import 'package:dream_home/src/constants/assets.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/info_icon.dart';
import 'package:flutter/material.dart';

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
