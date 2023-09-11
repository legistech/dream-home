import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../../common/utils/extensions/client_exception.dart';
import '../../../data/repository/auth.dart';
import '../../../data/repository/validator.dart';

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
