part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginEmailInvalid extends LoginState {}

final class LoginPasswordInvalid extends LoginState {}

final class LoginValid extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginButtonClickable extends LoginState {}

final class LoginSuccessful extends LoginState {}

final class LoginUserAuthorized extends LoginState {}

final class LoginUserUnauthorized extends LoginState {}

final class ToggledPasswordVisibility extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);
}
