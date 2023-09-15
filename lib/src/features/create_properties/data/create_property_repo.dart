import 'package:dream_home/src/db/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';

class CreatePropertiesRepo {
  static Future<ResultList<RecordModel>> get getproperties async {
    try {
      final pb = await PocketBaseInstance.instance;
      final record = pb.collection('properties').getList(
        headers: {'token': 'dev'},
        expand: 'createdBy',
      );
      return record;
    } on ClientException {
      rethrow;
    }
  }
}
