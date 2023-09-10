import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/property_list.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/common_choice_chip.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/featured_image.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/featured_info.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FeaturedPropertiesScreen extends StatelessWidget {
  const FeaturedPropertiesScreen({super.key, required this.properties});
  final List<Property> properties;
  final String baseUrl = 'https://dream-home.pockethost.io/api/files/';
  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);

    return Column(
      children: [
        SizedBox(height: height * 2),
        const AppBarView(),
        SizedBox(height: height * 1),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintText: 'Search for anything',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        IconlyLight.search,
                        color: Pellet.kDark,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyLight.filter,
                          color: Pellet.kDark,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 1),
        //! Bug 1: The [CommonFeaturedChoiceChip] label color is not as expected.
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonFeaturedChoiceChip(
              text: 'Buy',
              isSelected: true,
            ),
            CommonFeaturedChoiceChip(
              text: 'Rent',
              isSelected: false,
            ),
            CommonFeaturedChoiceChip(
              text: 'PG',
              isSelected: false,
            ),
            CommonFeaturedChoiceChip(
              text: 'Plot',
              isSelected: false,
            ),
          ],
        ),
        SizedBox(height: height * 2),
        FeaturedImage(
          '$baseUrl/${properties.first.collectionId}/${properties.first.id}/${properties.first.images!.first}',
          borderColor: Pellet.kPrimaryColor,
        ),
        SizedBox(height: height * 2),
        FeaturedInfo(
          leading: 'Featured Properties',
          trailing: 'View All',
          onTap: () {
            Navigator.pushNamed(
              context,
              '/view-all',
              arguments: {
                'properties': properties,
              },
            );
          },
        ),
        SizedBox(height: height * 1),
        PropertyListView(properties: properties, baseUrl: baseUrl),
      ],
    );
  }
}
