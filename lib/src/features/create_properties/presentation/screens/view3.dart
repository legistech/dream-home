import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/create_properties/presentation/views/app_bar.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/search_properties_field.dart';
import 'package:dream_home/src/features/user_profile/presentation/widgets/profile_button.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class View3 extends StatefulWidget {
  const View3({super.key});

  @override
  State<View3> createState() => _View3State();
}

class _View3State extends State<View3> {
  final numberController = TextEditingController();

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
                'step 3 of 3',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const LinearProgressIndicator(
                value: 1,
                minHeight: 5,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF004267)),
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: height * 2,
              ),
              const Text(
                'Property Name:',
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
                icon: Icons.navigate_next,
                text: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, '/featured-properties');
                }),
          ),
        ),
      ),
    );
  }
}
