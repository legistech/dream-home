import 'package:bloc/bloc.dart';
import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/features/authentication/data/repository/auth.dart';
import 'package:dream_home/src/features/authentication/data/repository/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';

part 'forgot_pwd_event.dart';
part 'forgot_pwd_state.dart';

class ForgotPwdBloc extends Bloc<ForgotPwdEvent, ForgotPwdState> {
  ForgotPwdBloc() : super(ForgotPwdInitial()) {
    on<ForgotEmailChangedEvent>((event, emit) {
      final email = event.email;
      if (Validator.validateEmail(email)) {
        return emit(ForgotValidEmailState());
      }
      emit(ForgotPwdInitial());
    });
    on<EmailSubmittedEvent>((event, emit) {
      try {
        final email = event.email;
        AuthRepo.requestVerification(email);
        emit(ForgotEmailSentSuccess());
      } on ClientException catch (e) {
        emit(ForgotEmailSentFailure(e.errorMessage));
      }
    });
  }
}
