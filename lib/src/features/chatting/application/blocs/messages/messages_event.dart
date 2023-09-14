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
