import 'package:dream_home/src/features/chatting/presentation/screens/chats.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../constants/screen.dart';
import '../../../features/featured_properties/domain/models/property.dart';
import '../../../features/featured_properties/presentation/screens/featured_properties.dart';
import '../../../features/user_profile/presentation/screens/profile.dart';
import '../../../theme/pellet.dart';

/// [HomeScreen] is the home page of the app.
/// It contains a [BottomNavigationBar] to navigate between the screens.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.properties});

  final List<Property> properties;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /// [screens] contains the list of screens to be displayed.
    /// [selectedIndex] is the index of the screen to be displayed.
    /// To add a new screen, add it to the [screens] list and add a new index to [selectedIndex].
    List<Widget> screens = [
      FeaturedPropertiesScreen(
        properties: widget.properties,
      ),
      const Center(
        child: Text('MapScreen'),
      ),
      const ChatsScreen(),
      const UserProfileScreen(),
    ];
    final width = ScreenSize.width(context);
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: screens[selectedIndex],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Pellet.kPrimaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/create-property');
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navigationBarItem(IconlyLight.home, 0, "Home"),
                navigationBarItem(Icons.map_outlined, 1, "Map"),
                SizedBox(width: width * 2),
                navigationBarItem(IconlyLight.chat, 2, "Inbox"),
                navigationBarItem(IconlyLight.profile, 3, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector navigationBarItem(IconData icon, int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          Icon(
            icon,
            color: selectedIndex != index
                ? Pellet.kDark.withOpacity(0.5)
                : Pellet.kDark,
          ),
          Text(
            text,
            style: TextStyle(
              color: selectedIndex != index
                  ? Pellet.kDark.withOpacity(0.5)
                  : Pellet.kDark,
            ),
          )
        ],
      ),
    );
  }
}
