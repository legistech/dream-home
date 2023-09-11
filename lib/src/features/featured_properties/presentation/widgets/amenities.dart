import 'package:flutter/material.dart';

import '../../../../theme/pellet.dart';
import '../../domain/models/property.dart';

class Amenities extends StatelessWidget {
  const Amenities({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: property.amenities!
          .map(
            (amenity) => Chip(
              label: Text(amenity),
              backgroundColor: Pellet.kWhite,
            ),
          )
          .toList(),
    );
  }
}
