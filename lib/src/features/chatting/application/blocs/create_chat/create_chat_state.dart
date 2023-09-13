part of 'create_chat_bloc.dart';

sealed class CreateChatState extends Equatable {
  const CreateChatState();

  @override
  List<Object> get props => [];
}

final class CreateChatInitial extends CreateChatState {}

final class CreateChatSearchingUsers extends CreateChatState {}

final class CreateChatCreatingChat extends CreateChatState {}

final class CreateChatCreated extends CreateChatState {}

final class CreateChatError extends CreateChatState {
  const CreateChatError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

final class CreateChatNoUserFound extends CreateChatState {}

final class CreateChatSearchError extends CreateChatState {
  const CreateChatSearchError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

final class CreateChatSearchedUsers extends CreateChatState {
  const CreateChatSearchedUsers({
    required this.users,
  });

  final List<User> users;

  @override
  List<Object> get props => [users];
}
