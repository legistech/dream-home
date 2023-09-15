import 'package:dream_home/src/common/presentation/widgets/elevated_button.dart';
import 'package:dream_home/src/common/presentation/widgets/show_error_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/assets.dart';
import '../../../features/authentication/application/blocs/login/login_bloc.dart';
import '../../../theme/pellet.dart';

/// [SplashScreen] appears every time when user opens the app.
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
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (route) => false,
              arguments: {'properties': state.properties});
        } else if (state is LoginUserUnauthorized) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/welcome', (route) => false);
        } else if (state is LoginUserAuthorizationTimeout) {
          ScaffoldMessenger.of(context)
              .showSnackBar(showErrorSnack(state.error));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Pellet.kWhite,
            body: Column(
              children: [
                Expanded(
                  child: Image.asset(Asset.logo),
                ),
                state is LoginUserAuthorizationTimeout
                    ? FutureBuilder(
                        future:
                            Future.delayed(const Duration(milliseconds: 1500)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CommonElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginValidateUser());
                              },
                              text: 'Try Again',
                            );
                          }
                          return const SizedBox();
                        })
                    : const SizedBox(),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
