import 'package:chip_list/chip_list.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/create_properties/presentation/screens/view3.dart';
import 'package:dream_home/src/features/create_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/options_info.dart';
import 'package:dream_home/src/features/user_profile/presentation/widgets/profile_button.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class View2 extends StatefulWidget {
  const View2({super.key});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  final numberController = TextEditingController();
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
                  'step 2 of 3',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const LinearProgressIndicator(
                  value: 0.66,
                  minHeight: 5,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF004267)),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Add Property Details:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Property type, Room details and more',
                  style: TextStyle(
                    fontSize: 15,
                    color: Pellet.kDark,
                  ),
                ),
                SizedBox(
                  height: height * 2,
                ),
                const Text(
                  'Property Kind:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: propertykind,
                  listOfChipIndicesCurrentlySeclected: [selectedpropertykind],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Property Type:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: propertyType,
                  listOfChipIndicesCurrentlySeclected: [selectedpropertyType],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Property Status:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: propertyStatus,
                  listOfChipIndicesCurrentlySeclected: [selectedPropertyStatus],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                  activeBgColorList: [Pellet.kPrimaryColor],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Bedrooms:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: bedrooms,
                  listOfChipIndicesCurrentlySeclected: [selectedBedroom],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Bathrooms:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: bathrooms,
                  listOfChipIndicesCurrentlySeclected: [selectedBathroom],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Balcony:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: balcony,
                  listOfChipIndicesCurrentlySeclected: [selectedBalcony],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Amenities:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  supportsMultiSelect: true,
                  listOfChipNames: amenities,
                  listOfChipIndicesCurrentlySeclected: [selectedAmenities],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Parking:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: parking,
                  listOfChipIndicesCurrentlySeclected: [selectedParking],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Parking:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
                ChipList(
                  listOfChipNames: isPetfriendly,
                  listOfChipIndicesCurrentlySeclected: [selectedIsPetfriendly],
                  inactiveBgColorList: [Pellet.kSecondaryColor],
                  activeBgColorList: [Pellet.kPrimaryColor],
                  inactiveTextColorList: [Pellet.kDark],
                ),
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Cost:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
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
                SizedBox(
                  height: height * 1,
                ),
                const Text(
                  'Built-up Area:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: height * 1,
                ),
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ProfileButton(
                icon: Icons.navigate_next,
                text: 'Almost there!',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const View3()));
                }),
          ),
        ),
      ),
    );
  }
}
