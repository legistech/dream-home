part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEmailChangedEvent extends RegisterEvent {
  const RegisterEmailChangedEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterNameChangedEvent extends RegisterEvent {
  const RegisterNameChangedEvent(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

final class RegisterPasswordChangedEvent extends RegisterEvent {
  const RegisterPasswordChangedEvent(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

final class RegisterSubmitButtonPressed extends RegisterEvent {
  const RegisterSubmitButtonPressed(
      {required this.email, required this.name, required this.password});
  final String email;
  final String name;
  final String password;
}

final class ToggleAgreeToTerms extends RegisterEvent {}
final class LoginTogglePasswordVisibility extends RegisterEvent {}