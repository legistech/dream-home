part of 'chats_bloc.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

final class ChatsInitial extends ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsLoaded extends ChatsState {
  final String currentUserId;
  final List<Chat> chats;
  const ChatsLoaded({required this.chats, required this.currentUserId});
}

final class ChatsLoadingFailed extends ChatsState {
  final String error;
  const ChatsLoadingFailed(this.error);
}
