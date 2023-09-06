import 'package:dream_home/src/features/authentication/application/blocs/login/login_bloc.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  // TODO: Remove this when proper logout is implemented

                  context.read<LoginBloc>().add(LogoutButtonPressed());
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: const Center(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
