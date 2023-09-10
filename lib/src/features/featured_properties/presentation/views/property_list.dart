import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/property_card.dart';
import 'package:flutter/widgets.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({
    super.key,
    required this.properties,
    required this.baseUrl,
  });

  final List<Property> properties;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return PropertyCard(
            baseUrl: baseUrl,
            property: property,
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: height * 1),
      ),
    );
  }
}
