import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../db/pocketbase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLogoutButtonPressed>((event, emit) async {
      final pb = await PocketBaseInstance.instance;
      pb.authStore.clear();
      emit(ProfileLoggedOut());
    });
  }
}
