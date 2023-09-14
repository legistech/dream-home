part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

final class MessagesInitial extends MessagesState {}

final class MessagesLoading extends MessagesState {}

final class MessagesSent extends MessagesState {}

final class MessagesSendingFailed extends MessagesState {}

final class MessagesLoadingFailed extends MessagesState {
  final String error;
  const MessagesLoadingFailed(this.error);
}

final class MessagesLoaded extends MessagesState {
  final List<Message> messages;
  const MessagesLoaded(this.messages);
}
