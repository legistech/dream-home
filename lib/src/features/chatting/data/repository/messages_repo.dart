import 'package:dream_home/src/db/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';

class MessagesRepo {
  /// [loadMessages] returns a list of messages matching the chat with [chatId]
  static Future<ResultList<RecordModel>> loadMessages(String chatId) async {
    try {
      final pb = await PocketBaseInstance.instance;
      final record = await pb.collection('messages').getList(
        headers: {'token': 'dev'},
        filter: 'chat = "$chatId"',
        sort: '-created',
      );
      return record;
    } on ClientException {
      rethrow;
    }
  }

  static Future<void> sendMessage(
      String receiverId, String chatId, String content) async {
    try {
      final pb = await PocketBaseInstance.instance;
      final senderId = pb.authStore.model.id;
      await pb.collection('messages').create(
        headers: {
          'token': 'dev',
        },
        body: {
          'sender': senderId,
          'receiver': receiverId,
          'content': content,
          'chat': chatId,
        },
      );
    } on ClientException {
      rethrow;
    }
  }
}
