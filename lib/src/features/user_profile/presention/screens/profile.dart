import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/user_profile/application/blocs/profile_bloc/profile_bloc.dart';
import 'package:dream_home/src/features/user_profile/presention/widgets/profile_button.dart';
import 'package:dream_home/src/features/user_profile/presention/widgets/profile_tile.dart';
import 'package:dream_home/src/features/user_profile/presention/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) => false,
          );
        }
      },
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.share),
              ],
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const UserInfo(
              text: 'hsbazr@gmail.com',
              icon: Icons.mail,
            ),
            SizedBox(height: height * 2),
            const ProfileTile(
              leadingIcon: Icons.person,
              trailingIcon: Icons.arrow_forward_ios,
              text: 'Account Settings',
            ),
            SizedBox(height: height * 1),
            const ProfileTile(
              leadingIcon: Icons.person,
              trailingIcon: Icons.arrow_forward_ios,
              text: 'Notification Settings',
            ),
            SizedBox(height: height * 1),
            const ProfileTile(
              leadingIcon: Icons.person,
              trailingIcon: Icons.arrow_forward_ios,
              text: 'My Listings',
            ),
            SizedBox(height: height * 1),
            const ProfileTile(
              leadingIcon: Icons.person,
              trailingIcon: Icons.arrow_forward_ios,
              text: 'Help & Support',
            ),
            const Spacer(),
            ProfileButton(
              icon: Icons.logout,
              text: 'Logout',
              onPressed: () {
                context.read<ProfileBloc>().add(ProfileLogoutButtonPressed());
              },
            ),
            SizedBox(height: height * 4),
          ],
        ),
      ),
    );
  }
}
