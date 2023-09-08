part of 'forgot_pwd_bloc.dart';

sealed class ForgotPwdState extends Equatable {
  const ForgotPwdState();

  @override
  List<Object> get props => [];
}

final class ForgotPwdInitial extends ForgotPwdState {}

final class ForgotValidEmailState extends ForgotPwdState {}

final class ForgotEmailSentSuccess extends ForgotPwdState {}

final class ForgotEmailSentFailure extends ForgotPwdState {
  const ForgotEmailSentFailure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
