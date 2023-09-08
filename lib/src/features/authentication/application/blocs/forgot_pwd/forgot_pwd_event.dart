part of 'forgot_pwd_bloc.dart';

sealed class ForgotPwdEvent extends Equatable {
  const ForgotPwdEvent();

  @override
  List<Object> get props => [];
}

final class ForgotEmailChangedEvent extends ForgotPwdEvent {
  const ForgotEmailChangedEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

final class EmailSubmittedEvent extends ForgotPwdEvent {
  const EmailSubmittedEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}
