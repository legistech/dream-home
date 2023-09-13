import 'package:dream_home/src/common/domain/models/user.dart';
import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/features/chatting/data/repository/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'create_chat_event.dart';
part 'create_chat_state.dart';

class CreateChatBloc extends Bloc<CreateChatEvent, CreateChatState> {
  CreateChatBloc() : super(CreateChatInitial()) {
    on<CreateChatInputChanged>((event, emit) async {
      if (event.query.isNotEmpty) {
        emit(CreateChatSearchingUsers());
        try {
          final record = await ChatRepository.getUsers(event.query);
          final users =
              record.items.map((user) => User.fromRecord(user)).toList();
          if (users.isEmpty) {
            emit(CreateChatNoUserFound());
            return;
          }
          emit(CreateChatSearchedUsers(users: users));
        } on ClientException catch (e) {
          emit(CreateChatSearchError(
            error: e.errorMessage,
          ));
        }
      }
    });
    on<CreateChatButtonPressed>((event, emit) async {
      emit(CreateChatCreatingChat());
      try {
        await ChatRepository.createChat(event.userId);
        emit(CreateChatCreated());
      } on ClientException catch (e) {
        emit(CreateChatError(
          error: e.errorMessage,
        ));
      }
    });
  }
}
