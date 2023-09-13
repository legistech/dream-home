part of 'chats_bloc.dart';

sealed class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object> get props => [];
}

final class ChatsLoad extends ChatsEvent {}

final class ChatsButtonClicked extends ChatsEvent {
  final String chatId;
  const ChatsButtonClicked({required this.chatId});

  @override
  List<Object> get props => [chatId];
}
