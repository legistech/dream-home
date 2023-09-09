import 'package:dream_home/src/db/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';

class Properties {
  static Future<ResultList<RecordModel>> get getProperties async {
    try {
      final pb = await PocketBaseInstance.instance;
      final record = pb.collection('properties').getList(
        headers: {'token': 'dev'},
      );
      return record;
    } on ClientException {
      rethrow;
    }
  }
}
