part of 'create_chat_bloc.dart';

sealed class CreateChatEvent extends Equatable {
  const CreateChatEvent();

  @override
  List<Object> get props => [];
}

final class CreateChatInputChanged extends CreateChatEvent {
  const CreateChatInputChanged({
    required this.query,
  });

  final String query;

  @override
  List<Object> get props => [query];
}

final class CreateChatButtonPressed extends CreateChatEvent {
  const CreateChatButtonPressed({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}
