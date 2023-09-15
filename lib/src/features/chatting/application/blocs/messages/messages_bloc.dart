import 'package:dream_home/src/common/utils/extensions/client_exception.dart';
import 'package:dream_home/src/db/pocketbase.dart';
import 'package:dream_home/src/features/chatting/data/repository/messages_repo.dart';
import 'package:dream_home/src/features/chatting/domain/models/message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  String chatId = '';
  List<Message> messages = [];
  MessagesBloc() : super(MessagesInitial()) {
    subscribeToMessages() async {
      PocketBase pb = await PocketBaseInstance.instance;
      return pb.collection('messages').subscribe('*', (e) async {
        final RecordModel? record = e.record;
        final Message message = Message.fromRecord(record!);
        if (message.chat == chatId) {
          add(MessageAdd(message));
        }
      });
    }

    subscribeToMessages();

    on<MessageAdd>(
      (event, emit) {
        emit(MessagesLoading());
        final message = event.message;
        final appendedMessagesList = [message, ...messages];
        messages = appendedMessagesList;
        emit(MessagesLoaded(appendedMessagesList));
      },
    );

    on<MessagesLoad>((event, emit) async {
      chatId = event.chatId;
      emit(MessagesLoading());
      try {
        final record = await MessagesRepo.loadMessages(event.chatId);
        messages =
            record.items.map((message) => Message.fromRecord(message)).toList();
        emit(MessagesLoaded(messages));
      } on ClientException catch (e) {
        emit(MessagesLoadingFailed(e.errorMessage));
      }
    });

    on<MessageSend>((event, emit) async {
      await MessagesRepo.sendMessage(
          event.receiverId, event.chatId, event.content);
    });
  }
}
