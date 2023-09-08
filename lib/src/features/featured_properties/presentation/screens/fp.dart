import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FeaturedPropertiesScreen extends StatelessWidget {
  const FeaturedPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);

    return Column(
      children: [
        SizedBox(height: height * 2),
        Row(
          children: [
            const Icon(IconlyBold.location),
            const SizedBox(width: 8),
            Text(
              'Pune',
              style: TextStyle(
                color: Pellet.kDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.heart)),
            IconButton(
              onPressed: () {},
              icon: const Badge(
                child: Icon(IconlyLight.notification),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 1),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintText: 'Search for anything',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        IconlyLight.search,
                        color: Pellet.kDark,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyLight.filter,
                          color: Pellet.kDark,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
