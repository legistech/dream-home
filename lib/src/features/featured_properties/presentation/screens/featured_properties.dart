import 'package:chip_list/chip_list.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/filters_bottom_sheet.dart';
import 'package:dream_home/src/features/featured_properties/presentation/views/property_list.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/featured_image.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/featured_info.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FeaturedPropertiesScreen extends StatefulWidget {
  const FeaturedPropertiesScreen({super.key, required this.properties});
  final List<Property> properties;

  @override
  State<FeaturedPropertiesScreen> createState() =>
      _FeaturedPropertiesScreenState();
}

class _FeaturedPropertiesScreenState extends State<FeaturedPropertiesScreen> {
  final String baseUrl = 'https://dream-home.pockethost.io/api/files/';
  final List<String> filterChip = ['Buy', 'Rent', 'Commercial', 'Furnished'];
  final selectedFilter = [0];
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);

    return Column(
      children: [
        SizedBox(height: height * 2),
        const AppBarView(),
        SizedBox(height: height * 1),
        Row(
          children: [
            CommonFeaturesSearchField(
              showFilters: true,
              searchController: _searchController,
            ),
          ],
        ),
        SizedBox(height: height * 1),
        ChipList(
          listOfChipNames: filterChip,
          listOfChipIndicesCurrentlySeclected: selectedFilter,
          activeBgColorList: [Pellet.kPrimaryColor],
          inactiveTextColorList: [Pellet.kDark],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height * 2),
        FeaturedImage(
          '$baseUrl/${widget.properties.first.collectionId}/${widget.properties.first.id}/${widget.properties.first.images!.first}',
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
                'properties': widget.properties,
              },
            );
          },
        ),
        SizedBox(height: height * 1),
        PropertyListView(properties: widget.properties, baseUrl: baseUrl),
      ],
    );
  }
}

class CommonFeaturesSearchField extends StatelessWidget {
  const CommonFeaturesSearchField({
    super.key,
    this.showFilters = false,
    required TextEditingController searchController,
    this.borderColor = Colors.transparent,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final bool showFilters;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: _searchController,
          keyboardType: TextInputType.text,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            hintText: 'Search for anything',
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
            prefixIcon: Icon(
              IconlyLight.search,
              color: Pellet.kDark,
            ),
            suffixIcon: showFilters
                ? IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const FiltersBottomSheet(),
                        isScrollControlled: true,
                        showDragHandle: true,
                        backgroundColor: Pellet.kWhite,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      IconlyLight.filter,
                      color: Pellet.kDark,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
