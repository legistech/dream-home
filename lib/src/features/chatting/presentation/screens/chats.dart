import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/featured_properties/presentation/widgets/search_properties_field.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late final TextEditingController searchController;

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
    return Column(
      children: [
        SizedBox(height: height * 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios),
            Text(
              'Chats',
              style: TextStyle(
                color: Pellet.kDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(IconlyLight.edit_square),
          ],
        ),
        SizedBox(height: height * 2),
        CommonFeaturesSearchField(
          searchController: searchController,
          hintText: 'Search for chats',
        ),
        SizedBox(height: height * 2),
        SizedBox(
          height: height * 65,
          child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: ListTile(
                    title: const Text(
                      'John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('Perfection is achieved not when..'),
                    leading: CircleAvatar(
                      backgroundColor: Pellet.kPrimaryColor.withOpacity(0.5),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 5);
              },
              itemCount: 10),
        ),
      ],
    );
  }
}
