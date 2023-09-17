import 'package:chip_list/chip_list.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/create_properties/presentation/screens/location_details.dart';
import 'package:dream_home/src/features/create_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/Common_bottom_bar.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_chip_list.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_progress_indicator.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_text.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/options_info.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key});

  @override
  State<PropertyDetailScreen> createState() => _View2State();
}

class _View2State extends State<PropertyDetailScreen> {
  List<String> propertykind = [
    'Residential',
    'Commercial',
  ];
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
  List<String> propertyStatus = [
    'Ready to Move',
    'Under Construction',
  ];
  List<String> bedrooms = [
    '1 RK',
    '1 BHK',
    '2 BHK',
    '3 BHK',
    '3+ BHK',
  ];
  List<String> bathrooms = [
    '1+',
    '1+',
    '2+',
    '3+',
    '4+',
  ];
  List<String> balcony = [
    '1',
    '2',
    '3',
    '3+',
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
  List<String> parking = [
    'Covered Parking',
    'Open Parking',
  ];
  List<String> isPetfriendly = [
    'Yes',
    'No',
  ];
  final int selectedBedroom = 0;
  final int selectedBathroom = 0;
  final int selectedBalcony = 0;
  final int selectedpropertykind = 0;
  final int selectedpropertyType = 0;
  final int selectedPropertyStatus = 0;
  final int selectedAmenities = 0;
  final int selectedParking = 0;
  final int selectedIsPetfriendly = 0;
  List<double> selectedBudget = [
    0,
    50,
  ];
  List<double> selectedBuiltUpAreas = [
    0,
    5000,
  ];
  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);

    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CommonAppBar(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Step 2 of 3',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: height * 1),
                  const CommonProgressIndicator(indicatorValue: 0.66),
                  SizedBox(height: height * 1),
                  const Text(
                    'Add Property Details:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: height * 0.5),
                  Text(
                    'Property type, Room details and more',
                    style: TextStyle(
                      fontSize: 15,
                      color: Pellet.kDark,
                    ),
                  ),
                  SizedBox(height: height * 2),
                  const CommonText(titletext: 'Property Kind:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: propertykind,
                      selectedListindex: selectedpropertykind),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Property Type:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: propertyType,
                      selectedListindex: selectedpropertyType),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Property Status'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: propertyStatus,
                      selectedListindex: selectedPropertyStatus),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Bedrooms:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: bedrooms, selectedListindex: selectedBedroom),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Bathrooms:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: bathrooms, selectedListindex: selectedBathroom),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Balcony:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: balcony, selectedListindex: selectedBalcony),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Amenities:'),
                  SizedBox(height: height * 1),
                  ChipList(
                    supportsMultiSelect: true,
                    listOfChipNames: amenities,
                    listOfChipIndicesCurrentlySeclected: [selectedAmenities],
                    inactiveBgColorList: [Pellet.kSecondaryColor],
                    activeBgColorList: [Pellet.kPrimaryColor],
                    inactiveTextColorList: [Pellet.kDark],
                  ),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Parking:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: parking, selectedListindex: selectedParking),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Pet Friendly:'),
                  SizedBox(height: height * 1),
                  CommonChipList(
                      list: isPetfriendly,
                      selectedListindex: selectedIsPetfriendly),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Cost:'),
                  SizedBox(height: height * 1),
                  OptionsInfo(
                    data: selectedBudget,
                    leading: '\$',
                    trailing: 'M+',
                  ),
                  RangeSlider(
                    max: 50,
                    values: RangeValues(selectedBudget[0], selectedBudget[1]),
                    onChanged: (value) {
                      setState(() {
                        selectedBudget[0] = value.start;
                        selectedBudget[1] = value.end;
                      });
                    },
                    activeColor: Pellet.kPrimaryColor,
                  ),
                  SizedBox(height: height * 1),
                  const CommonText(titletext: 'Built-up Area:'),
                  SizedBox(height: height * 1),
                  OptionsInfo(
                    data: selectedBuiltUpAreas,
                    leading: 'sqft',
                    trailing: 'sqft+',
                  ),
                  RangeSlider(
                    max: 5000,
                    values: RangeValues(
                        selectedBuiltUpAreas[0], selectedBuiltUpAreas[1]),
                    onChanged: (value) {
                      setState(() {
                        selectedBuiltUpAreas[0] = value.start;
                        selectedBuiltUpAreas[1] = value.end;
                      });
                    },
                    activeColor: Pellet.kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CommonBottomBar(
              icon: Icons.navigate_next,
              buttonText: 'Almost There',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const LocationDetailScreen()));
              })),
    );
  }
}
