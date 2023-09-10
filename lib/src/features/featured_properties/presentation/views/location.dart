import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(
          property.address!,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
