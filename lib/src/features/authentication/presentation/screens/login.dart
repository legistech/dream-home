import 'package:dream_home/src/common/presentation/widgets/elevated_button.dart';
import 'package:dream_home/src/common/presentation/widgets/show_error_snack.dart';
import 'package:dream_home/src/constants/assets.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/authentication/application/blocs/login/login_bloc.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/common_text_field.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/login_subtitle.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/login_title.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/nav_query.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/social_button.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return Container(
      decoration: BoxDecoration(
        gradient: Pellet.kBackgroundGradient,
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: ((context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(showErrorSnack(state.error));
          } else if (state is LoginSuccessful) {
            Navigator.pushNamed(context, '/home');
          }
        }),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const LoginTitle('Hello There'),
                      const LoginSubtitle('Welcome Back'),
                      SizedBox(height: height * 2),
                      CommonTextFormField(
                        errorText: state is LoginEmailInvalid
                            ? 'Invalid Email Address'
                            : '',
                        hintText: 'Enter email or username',
                        controller: _emailController,
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(LoginEmailChangedEvent(value));
                        },
                      ),
                      SizedBox(height: height * 1),
                      CommonTextFormField(
                        errorText: state is LoginPasswordInvalid
                            ? 'Your password must contain at-least 8 characters'
                            : '',
                        hintText: 'Enter password',
                        controller: _passwordController,
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(LoginPasswordChangedEvent(value));
                        },
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height * 2),
                      CommonElevatedButton(
                        onPressed: state is LoginValid
                            ? () {
                                context.read<LoginBloc>().add(
                                      LoginSubmitButtonPressed(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                              }
                            : null,
                        text: state is LoginLoading ? 'Loading...' : 'Login',
                      ),
                      SizedBox(height: height * 2),
                      const NavigationQuery(
                        title: 'Don\'t have an account?',
                        text: 'Register',
                      ),
                      SizedBox(height: height * 2),
                      const Divider(),
                      SizedBox(height: height * 2),
                      SocialButton(
                        asset: Asset.googleLogo,
                        text: 'Continue with Google',
                        onPressed: () {},
                      ),
                      SizedBox(height: height * 2),
                      SocialButton(
                        asset: Asset.facebookLogo,
                        text: 'Continue with Facebook',
                        onPressed: () {},
                      ),
                      SizedBox(height: height * 2),
                      SocialButton(
                        asset: Asset.appleLogo,
                        text: 'Continue with Apple',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
