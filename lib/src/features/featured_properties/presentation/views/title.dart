import 'package:flutter/material.dart';

import '../../data/repositories/helpers.dart';
import '../../domain/models/property.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(property.propertyName!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
        Text(
          '\$${HelperRepo.formatNumberWithSuffix(property.propertyCost!)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
