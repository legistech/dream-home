import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

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
