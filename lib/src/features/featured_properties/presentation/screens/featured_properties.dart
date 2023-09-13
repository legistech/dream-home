import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/screen.dart';
import '../../../../theme/pellet.dart';
import '../../application/blocs/bloc/featured_properties_bloc.dart';
import '../../domain/models/property.dart';
import '../views/app_bar.dart';
import '../widgets/featured_image.dart';
import '../widgets/featured_info.dart';
import '../widgets/property_card.dart';
import '../widgets/search_properties_field.dart';

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
  late List<Property> filteredProperties;
  @override
  void initState() {
    super.initState();
    filteredProperties = widget.properties;
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

    return BlocListener<FeaturedPropertiesBloc, FeaturedPropertiesState>(
      listener: (context, state) {
        if (state is FeaturedFilteredProperties) {
          filteredProperties = state.properties;
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarView(),
              SizedBox(height: height * 1),
              CommonFeaturesSearchField(
                showFilters: true,
                searchController: _searchController,
                hintText: 'Search for anything',
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
                extraOnToggle: (index) {
                  // Using setState as it is required by the library to rebuild the ui
                  setState(() {
                    context.read<FeaturedPropertiesBloc>().add(
                          FeaturedFilterChipSelected(
                            properties: widget.properties,
                            index: index,
                          ),
                        );
                  });
                },
              ),
              SizedBox(height: height * 2),
              if (filteredProperties.isNotEmpty) ...[
                FeaturedImage(
                  Asset.featuredImage,
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
                // PropertyListView(properties: filteredProperties, baseUrl: baseUrl),
                ...filteredProperties.map((property) {
                  return Column(
                    children: [
                      PropertyCard(
                        property: property,
                        baseUrl: baseUrl,
                      ),
                      SizedBox(height: height * 1),
                    ],
                  );
                }).toList(),
                SizedBox(height: height * 2),
              ] else ...[
                Icon(IconlyLight.filter, size: 50, color: Pellet.kDark),
                const SizedBox(height: 16),
                const Text(
                  'Nothing to see here',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
