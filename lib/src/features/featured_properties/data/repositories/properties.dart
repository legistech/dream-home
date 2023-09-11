import 'package:pocketbase/pocketbase.dart';

import '../../../../db/pocketbase.dart';

class PropertiesRepo {
  static Future<ResultList<RecordModel>> get getProperties async {
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
