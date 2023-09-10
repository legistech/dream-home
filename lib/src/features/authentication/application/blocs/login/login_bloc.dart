import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/features/authentication/data/repository/auth.dart';
import 'package:dream_home/src/features/authentication/data/repository/validator.dart';
import 'package:dream_home/src/features/featured_properties/data/repositories/properties.dart';
import 'package:dream_home/src/features/featured_properties/domain/models/property.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String email = '';
  String password = '';
  bool isPasswordVisible = false;
  LoginBloc() : super(LoginInitial()) {
    bool validCredentials(String email, String password) {
      return Validator.validateEmail(email) &&
          Validator.validatePassword(password);
    }

    on<LoginEmailChangedEvent>((event, emit) {
      email = event.email;
      if (!Validator.validateEmail(email)) {
        emit(LoginEmailInvalid());
      } else {
        if (validCredentials(email, password)) {
          emit(LoginValid());
        } else {
          emit(LoginInitial());
        }
      }
    });
    on<LoginPasswordChangedEvent>((event, emit) {
      password = event.password;
      if (!Validator.validatePassword(password)) {
        emit(LoginPasswordInvalid());
      } else {
        if (validCredentials(email, password)) {
          emit(LoginValid());
        } else {
          emit(LoginInitial());
        }
      }
    });

    on<LoginSubmitButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final email = event.email, password = event.password;
        await AuthRepo.login(email, password);
        emit(LoginSuccessful());
      } on ClientException catch (e) {
        emit(LoginFailure(e.errorMessage));
      }
    });

    on<LoginValidateUser>((event, emit) async {
      emit(LoginLoading());
      final timer = Stopwatch()..start();
      try {
        final bool isAuthorized = await AuthRepo.isUserAuthorized;
        late List<Property> properties;
        if (isAuthorized) {
          final record = await PropertiesRepo.getProperties;
          properties = record.items
              .map(
                (property) => Property.fromRecord(property),
              )
              .toList();
        }
        final timeTaken = timer.elapsedMilliseconds;
        Stopwatch().stop();

        if (timeTaken < 2000) {
          await Future.delayed(
            Duration(milliseconds: 2000 - timeTaken),
            () {
              isAuthorized
                  ? emit(LoginUserAuthorized(properties))
                  : emit(LoginUserUnauthorized());
            },
          );
        } else {
          isAuthorized
              ? emit(LoginUserAuthorized(properties))
              : emit(LoginUserUnauthorized());
        }
      } on ClientException catch (e) {
        emit(LoginFailure(e.errorMessage));
        debugPrint(e.errorMessage);
      }
    });

    on<LoginTogglePasswordVisibility>((event, emit) {
      // Storing the previous state to emit it again after toggling.
      LoginState prevState = state;
      isPasswordVisible = !isPasswordVisible;
      emit(ToggledPasswordVisibility());
      emit(prevState);
    });
  }
}
