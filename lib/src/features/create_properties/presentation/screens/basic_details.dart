import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/create_properties/presentation/screens/property_details.dart';
import 'package:dream_home/src/features/create_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/Common_bottom_bar.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_chip_list.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_progress_indicator.dart';
import 'package:dream_home/src/features/create_properties/presentation/widgets/common_text.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/search_properties_field.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CreatePropertyScreen extends StatefulWidget {
  const CreatePropertyScreen({super.key});

  @override
  State<CreatePropertyScreen> createState() => _CreatePropertyScreenState();
}

class _CreatePropertyScreenState extends State<CreatePropertyScreen> {
  final numberController = TextEditingController();
  List<String> userStatus = [
    'Owner',
    'Agent',
    'Builder',
  ];
  List<String> sellingStatus = [
    'Sell',
    'Rent/Lease',
  ];
  final int selecteduserStatus = 0;
  final int selectedSellingStatus = 0;

  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Step 1 of 3',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CommonProgressIndicator(indicatorValue: 0.33),
                SizedBox(height: height * 1),
                const Text(
                  'Add Basic Details:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: height * 0.5),
                Text(
                  'your intent and contact details',
                  style: TextStyle(
                    fontSize: 15,
                    color: Pellet.kDark,
                  ),
                ),
                SizedBox(height: height * 2),
                const CommonText(titletext: 'You are:'),
                SizedBox(height: height * 1),
                CommonChipList(
                    list: userStatus, selectedListindex: selecteduserStatus),
                SizedBox(height: height * 1),
                const CommonText(titletext: 'You are here to:'),
                SizedBox(height: height * 1),
                CommonChipList(
                    list: sellingStatus,
                    selectedListindex: selectedSellingStatus),
                SizedBox(height: height * 1),
                const CommonText(titletext: 'Your contact details:'),
                SizedBox(height: height * 1),
                CommonFeaturesSearchField(
                  searchController: numberController,
                  hintText: '',
                  showPrefixIcon: false,
                ),
                SizedBox(height: height * 1),
                Row(
                  children: [
                    const Text(
                      'Are you a registered user?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Pellet.kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: CommonBottomBar(
              icon: Icons.navigate_next,
              buttonText: 'Next',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const PropertyDetailScreen()));
                // CreatePropertyRepo repo = CreatePropertyRepo();
                // await repo.createProperty();
              })),
    );
  }
}
