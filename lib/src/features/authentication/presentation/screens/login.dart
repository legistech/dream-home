import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/widgets/elevated_button.dart';
import '../../../../common/presentation/widgets/show_error_snack.dart';
import '../../../../constants/assets.dart';
import '../../../../constants/screen.dart';
import '../../../../theme/pellet.dart';
import '../../application/blocs/login/login_bloc.dart';
import '../views/forgot_pwd.dart';
import '../widgets/common_text_field.dart';
import '../widgets/login_subtitle.dart';
import '../widgets/login_title.dart';
import '../widgets/nav_query.dart';
import '../widgets/social_button.dart';

/// [LoginScreen] is the screen where the user can login to the app.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _forgotPwdEmailController;
  late final TextEditingController _passwordController;
  bool doesUserAgreeToTerms = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _forgotPwdEmailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _forgotPwdEmailController.dispose();
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
            Navigator.pushNamed(
              context,
              '/home',
              arguments: {'properties': state.properties},
            );
          }
        }),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/welcome', (route) => false);
              },
              icon: const Icon(Icons.arrow_back_ios),
            )),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const AuthTitle('Hello There'),
                      const AuthSubtitle('Welcome Back'),
                      SizedBox(height: height * 2),
                      CommonAuthTextField(
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        errorText: state is LoginEmailInvalid
                            ? 'How about a valid email?'
                            : '',
                        hintText: 'Enter email',
                        controller: _emailController,
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(LoginEmailChangedEvent(value));
                        },
                      ),
                      SizedBox(height: height * 1),
                      CommonAuthTextField(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            context
                                .read<LoginBloc>()
                                .add(LoginTogglePasswordVisibility());
                          },
                          child: context.read<LoginBloc>().isPasswordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        errorText: state is LoginPasswordInvalid
                            ? 'How about a strong password?'
                            : '',
                        hintText: 'Enter password',
                        controller: _passwordController,
                        obscureText:
                            !context.read<LoginBloc>().isPasswordVisible,
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(LoginPasswordChangedEvent(value));
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            forgetPasswordBottomSheet(
                                context, _forgotPwdEmailController);
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                      NavigationQuery(
                        title: 'Don\'t have an account?',
                        text: 'Register',
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/register', (route) => false);
                        },
                      ),
                      const Divider(),
                      SocialButton(
                        asset: Asset.googleLogo,
                        text: 'Google',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              showErrorSnack('Backlogged this feature'));
                        },
                      ),
                      SizedBox(height: height * 2),
                      SocialButton(
                        asset: Asset.facebookLogo,
                        text: 'Facebook',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              showErrorSnack('Backlogged this feature'));
                        },
                      ),
                      SizedBox(height: height * 2),
                      SocialButton(
                        asset: Asset.appleLogo,
                        text: 'Apple',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              showErrorSnack('Backlogged this feature'));
                        },
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
