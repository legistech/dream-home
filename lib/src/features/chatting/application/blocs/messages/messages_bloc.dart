import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/features/chatting/data/repository/messages_repo.dart';
import 'package:dream_home/src/features/chatting/domain/models/message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(MessagesInitial()) {
    on<MessagesLoad>((event, emit) async {
      emit(MessagesLoading());
      try {
        final record = await MessagesRepo.loadMessages(event.chatId);
        final messages =
            record.items.map((message) => Message.fromRecord(message)).toList();
        emit(MessagesLoaded(messages));
      } on ClientException catch (e) {
        emit(MessagesLoadingFailed(e.errorMessage));
      }
    });
  }
}
