import 'package:bloc/bloc.dart';
import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/db/pocketbase.dart';
import 'package:dream_home/src/features/chatting/data/repository/chat_repo.dart';
import 'package:dream_home/src/features/chatting/domain/models/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(ChatsInitial()) {
    on<ChatsLoad>((event, emit) async {
      try {
        emit(ChatsLoading());
        final record = await ChatRepository.loadChats();
        final pb = await PocketBaseInstance.instance;
        final userId = pb.authStore.model.id;
        final chats =
            record.items.map((chat) => Chat.fromRecord(chat)).toList();
        emit(ChatsLoaded(chats: chats, currentUserId: userId));
      } on ClientException catch (e) {
        emit(ChatsLoadingFailed(e.errorMessage));
      }
    });
  }
}
