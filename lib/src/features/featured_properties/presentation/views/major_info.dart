import 'package:flutter/material.dart';

import '../../domain/models/property.dart';

class MajorInfoView extends StatelessWidget {
  const MajorInfoView({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.bed_outlined,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(
          '${property.bedRoom!} Bedrooms',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.bathroom_outlined,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(
          '${property.bathRoom!} Bathrooms',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.social_distance,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(
          '${property.propertySize!} sqft',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
