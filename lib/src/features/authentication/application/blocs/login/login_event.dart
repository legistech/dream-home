part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailChangedEvent extends LoginEvent {
  const LoginEmailChangedEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

final class LoginPasswordChangedEvent extends LoginEvent {
  const LoginPasswordChangedEvent(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

final class LoginSubmitButtonPressed extends LoginEvent {
  const LoginSubmitButtonPressed({required this.email, required this.password});
  final String email;
  final String password;
}


final class LoginValidateUser extends LoginEvent {}
final class LoginTogglePasswordVisibility extends LoginEvent {}
