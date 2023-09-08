import 'package:dream_home/src/common/presentation/widgets/elevated_button.dart';
import 'package:dream_home/src/common/presentation/widgets/show_error_snack.dart';
import 'package:dream_home/src/constants/assets.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/authentication/application/blocs/register/register_bloc.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/common_text_field.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/login_subtitle.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/login_title.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/nav_query.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/social_button.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [RegisterScreen] is the screen where the user can register to the app.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenSize.height(context);
    return Container(
        decoration: BoxDecoration(
          gradient: Pellet.kBackgroundGradient,
        ),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(showErrorSnack(state.error));
            } else if (state is RegisterSuccessful) {
              Navigator.pushNamed(context, '/home');
            }
          },
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const AuthTitle('Hello There'),
                        const AuthSubtitle('Get Started'),
                        SizedBox(height: height * 2),
                        CommonAuthTextField(
                          prefixIcon: const Icon(Icons.email),
                          keyboardType: TextInputType.emailAddress,
                          errorText: state is RegisterEmailInvalid
                              ? 'What about a valid email?'
                              : null,
                          hintText: 'Enter email',
                          controller: _emailController,
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterEmailChangedEvent(value));
                          },
                        ),
                        SizedBox(height: height * 2),
                        CommonAuthTextField(
                          prefixIcon: const Icon(Icons.person),
                          keyboardType: TextInputType.name,
                          errorText: state is RegisterNameInvalid
                              ? 'What about a valid name?'
                              : null,
                          hintText: 'Enter full name',
                          controller: _fullNameController,
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterNameChangedEvent(value));
                          },
                        ),
                        SizedBox(height: height * 2),
                        CommonAuthTextField(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              context
                                  .read<RegisterBloc>()
                                  .add(LoginTogglePasswordVisibility());
                            },
                            child:
                                context.read<RegisterBloc>().isPasswordVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          errorText: state is RegisterPasswordInvalid
                              ? 'What about a valid password?'
                              : null,
                          hintText: 'Enter password',
                          controller: _passwordController,
                          obscureText:
                              !context.read<RegisterBloc>().isPasswordVisible,
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RegisterPasswordChangedEvent(value));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: context
                                  .read<RegisterBloc>()
                                  .doesUserAgreeToTerms,
                              onChanged: (value) {
                                context
                                    .read<RegisterBloc>()
                                    .add(ToggleAgreeToTerms());
                              },
                            ),
                            RichText(
                                text: TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(color: Pellet.kDark),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    color: Pellet.kDark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                        CommonElevatedButton(
                          onPressed: state is RegisterButtonClickable
                              ? () {
                                  context.read<RegisterBloc>().add(
                                        RegisterSubmitButtonPressed(
                                          email: _emailController.text,
                                          name: _fullNameController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                }
                              : null,
                          text: state is RegisterLoading
                              ? 'Loading...'
                              : 'Register',
                        ),
                        SizedBox(height: height * 2),
                        NavigationQuery(
                          title: 'Already have an account?',
                          text: 'Login',
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false);
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
        ));
  }
}
