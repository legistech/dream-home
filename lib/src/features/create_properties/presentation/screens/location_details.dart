import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/create_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/Common_bottom_bar.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_details_textfield.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_progress_indicator.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_small_textfield.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_text.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/search_properties_field.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class LocationDetailScreen extends StatefulWidget {
  const LocationDetailScreen({super.key});

  @override
  State<LocationDetailScreen> createState() => _View3State();
}

class _View3State extends State<LocationDetailScreen> {
  final propertyNameController = TextEditingController();
  final floorNoController = TextEditingController();
  final propertyNoController = TextEditingController();
  final addressController = TextEditingController();
  final propertyDetailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    propertyNameController.dispose();
    floorNoController.dispose();
    propertyNoController.dispose();
    addressController.dispose();
    propertyDetailController.dispose();
  }

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
                    'Step 3 of 3',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: height * 1),
                  const CommonProgressIndicator(indicatorValue: 1),
                  SizedBox(height: height * 1),
                  const Text(
                    'Add Location Details:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Address, Photos and videos',
                    style: TextStyle(
                      fontSize: 15,
                      color: Pellet.kDark,
                    ),
                  ),
                  SizedBox(height: height * 2),
                  const CommonText(titletext: 'Property Name:'),
                  SizedBox(height: height * 1),
                  CommonFeaturesSearchField(
                      searchController: propertyNameController,
                      hintText: '',
                      showPrefixIcon: false),
                  SizedBox(height: height * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(titletext: 'Floor No:'),
                          SizedBox(height: height * 0.5),
                          CommonSmallTextfield(controller: floorNoController),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(titletext: 'Flat/Property No:'),
                          SizedBox(height: height * 0.5),
                          CommonSmallTextfield(
                              controller: propertyNoController),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 2),
                  const CommonText(titletext: 'Address:'),
                  SizedBox(height: height * 1),
                  CommonFeaturesSearchField(
                    searchController: addressController,
                    hintText: '',
                    showPrefixIcon: false,
                  ),
                  SizedBox(height: height * 1),
                  const CommonText(
                      titletext: 'what makes your property special?'),
                  const Text(
                      'Add description for clarity and more listing visibility'),
                  SizedBox(height: height * 1),
                  CommonDetailsTextfield(controller: propertyDetailController)
                ],
              ),
            ),
          ),
          bottomNavigationBar: CommonBottomBar(
              icon: Icons.done, buttonText: 'Done', ontap: () {})),
    );
  }
}
