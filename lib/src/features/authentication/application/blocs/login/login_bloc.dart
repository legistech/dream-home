import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/db/pocketbase.dart';
import 'package:dream_home/src/features/authentication/data/repository/auth.dart';
import 'package:dream_home/src/features/authentication/data/repository/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String email = '';
  String password = '';
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
        final timeTaken = timer.elapsedMilliseconds;
        Stopwatch().stop();

        if (timeTaken < 2000) {
          await Future.delayed(
            Duration(milliseconds: 2000 - timeTaken),
            () {
              isAuthorized
                  ? emit(LoginUserAuthorized())
                  : emit(LoginUserUnauthorized());
            },
          );
        } else {
          isAuthorized
              ? emit(LoginUserAuthorized())
              : emit(LoginUserUnauthorized());
        }
      } on ClientException catch (e) {
        emit(LoginFailure(e.errorMessage));
        debugPrint(e.errorMessage);
      }
    });

    // TODO: Remove this when proper logout is implemented
    // Currently calling adding this state from app bar of home page.
    on<LogoutButtonPressed>((event, emit) async {
      final pb = await PocketBaseInstance.instance;
      pb.authStore.clear();
    });
  }
}
