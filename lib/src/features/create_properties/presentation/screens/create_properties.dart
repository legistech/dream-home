import 'package:chip_list/chip_list.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/search_properties_field.dart';
import 'package:dream_home/src/features/user_profile/presentation/widgets/profile_button.dart';
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
  List<String> isSelling = [
    'Sell',
    'Rent/Lease',
  ];
  final int selecteduserStatus = 0;
  final int selectedisSelling = 0;
  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);

    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'step 1 of 3',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const LinearProgressIndicator(
                value: 0.33,
                minHeight: 5,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF004267)),
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add Basic Details:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'your intent and contact details',
                style: TextStyle(
                  fontSize: 15,
                  color: Pellet.kDark,
                ),
              ),
              SizedBox(
                height: height * 2,
              ),
              const Text(
                'You are:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: height * 1,
              ),
              ChipList(
                listOfChipNames: userStatus,
                listOfChipIndicesCurrentlySeclected: [selecteduserStatus],
                inactiveBgColorList: [Pellet.kSecondaryColor],
                activeBgColorList: [Pellet.kPrimaryColor],
                inactiveTextColorList: [Pellet.kDark],
              ),
              SizedBox(
                height: height * 1,
              ),
              const Text(
                'You are here to:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: height * 1,
              ),
              ChipList(
                listOfChipNames: isSelling,
                listOfChipIndicesCurrentlySeclected: [selectedisSelling],
                inactiveBgColorList: [Pellet.kSecondaryColor],
                activeBgColorList: [Pellet.kPrimaryColor],
                inactiveTextColorList: [Pellet.kDark],
              ),
              SizedBox(
                height: height * 1,
              ),
              const Text(
                'Your contact details:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: height * 1,
              ),
              CommonFeaturesSearchField(
                searchController: numberController,
                hintText: '',
                showPrefixIcon: false,
              ),
              SizedBox(
                height: height * 1,
              ),
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ProfileButton(
                icon: Icons.navigate_next, text: 'Next', onPressed: () {}),
          ),
        ),
      ),
    );
  }
}
