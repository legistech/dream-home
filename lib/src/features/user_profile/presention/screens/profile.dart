import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/user_profile/application/blocs/profile_bloc/profile_bloc.dart';
import 'package:dream_home/src/theme/pellet.dart';
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

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    final width = ScreenSize.width(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(width * 100, height * 5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    this.onTap,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.text,
  });

  final Function()? onTap;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 5,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Pellet.kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: Pellet.kWhite,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Pellet.kWhite),
            ),
            const Spacer(),
            Icon(
              trailingIcon,
              color: Pellet.kWhite,
            )
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Pellet.kDark.withOpacity(0.5),
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
