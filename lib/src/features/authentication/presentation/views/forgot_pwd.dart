import 'package:dream_home/src/common/presentation/widgets/elevated_button.dart';
import 'package:dream_home/src/common/presentation/widgets/show_error_snack.dart';
import 'package:dream_home/src/constants/screen.dart';
import 'package:dream_home/src/features/authentication/application/blocs/forgot_pwd/forgot_pwd_bloc.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/common_text_field.dart';
import 'package:dream_home/src/features/authentication/presentation/widgets/forgot_pwd.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> forgetPasswordBottomSheet(
    BuildContext context, TextEditingController emailController) {
  final height = ScreenSize.height(context);

  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          gradient: Pellet.kBackgroundGradient,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const DragHandle(),
                const SizedBox(height: 30),
                const SheetTitle(title: 'Forgot Password?'),
                const SizedBox(height: 16),
                const Text(
                    'Enter your email address and we will send you a link to reset your password'),
                SizedBox(height: height * 5),
                BlocBuilder<ForgotPwdBloc, ForgotPwdState>(
                  builder: (context, state) {
                    return CommonAuthTextField(
                      onChanged: (value) {
                        context
                            .read<ForgotPwdBloc>()
                            .add(ForgotEmailChangedEvent(value));
                      },
                      hintText: 'Enter your email',
                      controller: emailController,
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    );
                  },
                ),
                const SizedBox(height: 80),
                SizedBox(
                  child: BlocConsumer<ForgotPwdBloc, ForgotPwdState>(
                    listener: (context, state) {
                      if (state is ForgotEmailSentFailure) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(showErrorSnack(state.errorMessage));
                      } else if (state is ForgotEmailSentSuccess) {
                        Future.delayed(const Duration(milliseconds: 800), () {
                          Navigator.pop(context);
                        });
                      }
                    },
                    builder: (context, state) {
                      return CommonElevatedButton(
                        onPressed: state is ForgotValidEmailState
                            ? () {
                                context.read<ForgotPwdBloc>().add(
                                    EmailSubmittedEvent(emailController.text));
                              }
                            : null,
                        text: state is ForgotEmailSentSuccess
                            ? 'Email Sent'
                            : 'Send Email',
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.viewInsetsOf(context).bottom,
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
