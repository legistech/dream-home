import 'package:dream_home/src/db/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';

class ChatRepository {
  /// [getUsers] returns a list of users based on the name query
  static Future<ResultList<RecordModel>> getUsers(String query) async {
    final pb = await PocketBaseInstance.instance;
    final record = await pb.collection('users').getList(
      headers: {'token': 'dev'},
      filter: 'name = "$query"',
    );
    return record;
  }

  /// [doesChatExist] returns record id if a chat exists between the current user and the user with [userId]
  static Future<String> doesChatExist(String userId) async {
    try {
      final pb = await PocketBaseInstance.instance;
      String creatorId = pb.authStore.model.id;
      final record = await pb.collection('chats').getList(
        headers: {'token': 'dev'},
        filter: 'users ~ "$userId" && users ~ "$creatorId"',
      );
      return record.items.isEmpty ? '' : record.items.first.id;
    } on ClientException {
      rethrow;
    }
  }

  /// [loadChats] returns a list of chats matching the current user
  static Future<ResultList<RecordModel>> loadChats() async {
    try {
      final pb = await PocketBaseInstance.instance;
      String id = pb.authStore.model.id;
      final record = await pb.collection('chats').getList(
        headers: {'token': 'dev'},
        filter: 'users ~ "$id"',
        expand: 'users',
      );
      return record;
    } on ClientException {
      rethrow;
    }
  }

  /// [loadMessages] returns a list of messages matching the chat with [chatId]
  static Future<ResultList<RecordModel>> loadMessages(String chatId) async {
    try {
      final pb = await PocketBaseInstance.instance;
      final record = await pb.collection('messages').getList(
        headers: {'token': 'dev'},
        filter: 'chat = "$chatId"',
      );
      return record;
    } on ClientException {
      rethrow;
    }
  }

  /// [createChat] creates a new chat between the current user and the user with [userId]
  /// if chat between these users already exists, it returns the id of the existing chat
  static Future<String> createChat(String userId) async {
    try {
      final pb = await PocketBaseInstance.instance;
      String doesChatExist = await ChatRepository.doesChatExist(userId);
      if (doesChatExist.isNotEmpty) {
        return doesChatExist;
      }
      String createdBy = pb.authStore.model.id;
      String createdWith = userId;
      final record = await pb.collection('chats').create(
        headers: {'token': 'dev'},
        body: {
          'users': [createdBy, createdWith],
        },
      );
      return record.id;
    } on ClientException {
      rethrow;
    }
  }
}
