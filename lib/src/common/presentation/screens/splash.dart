import 'package:dream_home/src/constants/assets.dart';
import 'package:dream_home/src/features/authentication/application/blocs/login/login_bloc.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ─── Validate User And Manage The Navigation Accordingly. ────
    BlocProvider.of<LoginBloc>(context).add(LoginValidateUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginUserAuthorized) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        } else if (state is LoginUserUnauthorized) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/welcome', (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Pellet.kWhite,
        body: Center(
          child: Image.asset(Asset.logo),
        ),
      ),
    );
  }
}
