import 'package:chip_list/chip_list.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/presentation/screens/featured_properties.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/options_info.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/options_title.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({
    super.key,
  });

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  late final TextEditingController searchController;
  List<String> propertyType = [
    'Apartment',
    'Independent House',
    'Builder Floor',
    'Plot',
    'Studio',
    'Duplex',
    'Penthouse',
    'Villa'
  ];
  List<String> bedrooms = [
    '1 RK',
    '1 BHK',
    '2 BHK',
    '3 BHK',
    '3+ BHK',
  ];
  List<String> amenities = [
    'Lift',
    'CCTV',
    'Security Guard',
    'Parking',
    'Gas Pipeline',
    'Garden',
    'Swimming Pool',
    'Gym',
  ];
  List<String> propertyStatus = [
    'Ready to Move',
    'Under Construction',
  ];
  List<String> furnishingStatus = [
    'Furnished',
    'Semi-Furnished',
    'Unfurnished',
  ];

  final int selectedPropertyType = 0;
  final int selectedBedroom = 0;
  final int selectedAmenities = 0;
  final int selectedPropertyStatus = 0;
  final int selectedFurnishingStatus = 0;
  List<double> selectedBudget = [
    0,
    50,
  ];
  List<double> selectedBuiltUpAreas = [
    0,
    5000,
  ];
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return Container(
      height: height * 90,
      color: Pellet.kWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Clear all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Pellet.kGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 1),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                SizedBox(width: width * 2),
                const Text(
                  // TODO: Add real location when dervaish provides
                  'Pune',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'Change Location',
                  style: TextStyle(
                    color: Pellet.kGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 1),
            CommonFeaturesSearchField(
              searchController: searchController,
              borderColor: Pellet.kGrey,
            ),
            const OptionsTitle('Property Type'),
            ChipList(
              listOfChipNames: propertyType,
              listOfChipIndicesCurrentlySeclected: [selectedPropertyType],
              inactiveBgColorList: [Pellet.kSecondaryColor],
              activeBgColorList: [Pellet.kPrimaryColor],
              inactiveTextColorList: [Pellet.kDark],
            ),
            const OptionsTitle('Budget'),
            OptionsInfo(data: selectedBudget),
            RangeSlider(
              max: 50,
              values: RangeValues(selectedBudget[0], selectedBudget[1]),
              onChanged: (value) {
                // TODO: Remove setState(){} after implementing bloc
                setState(() {
                  selectedBudget[0] = value.start;
                  selectedBudget[1] = value.end;
                });
              },
              activeColor: Pellet.kPrimaryColor,
            ),
            const OptionsTitle('Built-up Area'),
            OptionsInfo(data: selectedBuiltUpAreas),
            RangeSlider(
              max: 5000,
              values:
                  RangeValues(selectedBuiltUpAreas[0], selectedBuiltUpAreas[1]),
              onChanged: (value) {
                setState(() {
                  selectedBuiltUpAreas[0] = value.start;
                  selectedBuiltUpAreas[1] = value.end;
                });
              },
              activeColor: Pellet.kPrimaryColor,
            ),
            const OptionsTitle('Bedrooms'),
            ChipList(
              listOfChipNames: bedrooms,
              listOfChipIndicesCurrentlySeclected: [selectedBedroom],
              inactiveBgColorList: [Pellet.kSecondaryColor],
              activeBgColorList: [Pellet.kPrimaryColor],
              inactiveTextColorList: [Pellet.kDark],
            ),
            const OptionsTitle('Bathrooms'),
            ChipList(
              supportsMultiSelect: true,
              listOfChipNames: amenities,
              listOfChipIndicesCurrentlySeclected: [selectedAmenities],
              inactiveBgColorList: [Pellet.kSecondaryColor],
              activeBgColorList: [Pellet.kPrimaryColor],
              inactiveTextColorList: [Pellet.kDark],
            ),
            const OptionsTitle('Amenities'),
            ChipList(
              listOfChipNames: propertyStatus,
              listOfChipIndicesCurrentlySeclected: [selectedPropertyStatus],
              inactiveBgColorList: [Pellet.kSecondaryColor],
              inactiveTextColorList: [Pellet.kDark],
              activeBgColorList: [Pellet.kPrimaryColor],
            ),
            const OptionsTitle('Property Status'),
            ChipList(
              listOfChipNames: furnishingStatus,
              inactiveBgColorList: [Pellet.kSecondaryColor],
              listOfChipIndicesCurrentlySeclected: [selectedFurnishingStatus],
              activeBgColorList: [Pellet.kPrimaryColor],
              inactiveTextColorList: [Pellet.kDark],
            ),
            SizedBox(height: height * 2),
            SizedBox(
              width: width * 100,
              height: height * 6,
              child: ElevatedButton(
                  onPressed: () {
                    // TODO: Apply search filters and search for properties once main search filter is done.
                  },
                  child: const Text('Apply Filters')),
            ),
          ],
        ),
      ),
    );
  }
}
