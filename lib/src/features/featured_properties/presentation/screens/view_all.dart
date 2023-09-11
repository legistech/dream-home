import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../theme/pellet.dart';
import '../../domain/models/property.dart';
import '../views/featured_property_list.dart';
import '../widgets/view_title.dart';

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
