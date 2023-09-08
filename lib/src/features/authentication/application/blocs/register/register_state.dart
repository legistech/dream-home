part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterEmailInvalid extends RegisterState {}

final class RegisterNameInvalid extends RegisterState {}

final class ToggledAgreeToTerms extends RegisterState {
  const ToggledAgreeToTerms();
}

final class RegisterPasswordInvalid extends RegisterState {}

final class RegisterValid extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterButtonClickable extends RegisterState {}

final class RegisterSuccessful extends RegisterState {}
final class RegisterTogglePasswordVisibility extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String error;
  const RegisterFailure(this.error);
}
