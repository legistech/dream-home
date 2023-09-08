import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/features/authentication/data/repository/auth.dart';
import 'package:dream_home/src/features/authentication/data/repository/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  bool doesUserAgreeToTerms = false;
  bool isPasswordVisible = false;

  String email = '';
  String name = '';
  String password = '';
  RegisterBloc() : super(RegisterInitial()) {
    bool validCredentials(String email, String name, String password) {
      if (doesUserAgreeToTerms == false) return false;
      return Validator.validateEmail(email) &&
          Validator.validatePassword(password) &&
          name.isNotEmpty;
    }

    on<RegisterEmailChangedEvent>((event, emit) {
      email = event.email;
      if (!Validator.validateEmail(email)) {
        return emit(RegisterEmailInvalid());
      } else if (validCredentials(email, name, password)) {
        return emit(RegisterButtonClickable());
      }
      emit(RegisterInitial());
    });
    on<RegisterNameChangedEvent>((event, emit) {
      name = event.name;
      if (name.isEmpty) {
        return emit(RegisterNameInvalid());
      } else if (validCredentials(email, name, password)) {
        return emit(RegisterButtonClickable());
      }
      emit(RegisterInitial());
    });
    on<RegisterPasswordChangedEvent>((event, emit) {
      password = event.password;
      if (!Validator.validatePassword(password)) {
        return emit(RegisterPasswordInvalid());
      } else if (validCredentials(email, name, password)) {
        return emit(RegisterButtonClickable());
      }
      emit(RegisterInitial());
    });

    on<ToggleAgreeToTerms>((event, emit) {
      // Storing the previous state to emit it again after toggling.
      RegisterState prevState = state;
      doesUserAgreeToTerms = !doesUserAgreeToTerms;
      emit(const ToggledAgreeToTerms());
      if (validCredentials(email, name, password)) {
        return emit(RegisterButtonClickable());
      } else {
        if (prevState is RegisterButtonClickable) {
          return emit(RegisterInitial());
        }
        emit(prevState);
      }
    });
    on<RegisterSubmitButtonPressed>((event, emit) async {
      // Storing the previous state to emit it again after toggling.
      emit(RegisterLoading());
      try {
        await AuthRepo.register(email, name, password);
        await AuthRepo.login(email, password);
        emit(RegisterSuccessful());
      } on ClientException catch (e) {
        emit(RegisterFailure(e.errorMessage));
      }
    });
    on<LoginTogglePasswordVisibility>((event, emit) {
      // Storing the previous state to emit it again after toggling.
      RegisterState prevState = state;
      isPasswordVisible = !isPasswordVisible;
      emit(RegisterTogglePasswordVisibility());
      emit(prevState);
    });
  }
}
