part of 'messages_bloc.dart';

sealed class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

final class MessagesLoad extends MessagesEvent {
  final String chatId;
  const MessagesLoad(this.chatId);
}

final class MessageAdd extends MessagesEvent {
  final Message message;
  const MessageAdd(this.message);
}

final class MessageSend extends MessagesEvent {
  final String chatId;
  final String content;
  final String receiverId;
  const MessageSend(
      {required this.chatId, required this.content, required this.receiverId});
}
