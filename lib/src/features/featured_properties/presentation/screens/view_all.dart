import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/featured_property_list.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/view_title.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ViewAllPropertiesScreen extends StatelessWidget {
  const ViewAllPropertiesScreen({super.key, required this.properties});
  final List<Property> properties;
  final String baseUrl = 'https://dream-home.pockethost.io/api/files/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const ViewTitle('Featured Properties'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Badge(
                child: Icon(
                  IconlyLight.notification,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FeaturedPropertyList(properties: properties, baseUrl: baseUrl),
        ),
      ),
    );
  }
}
