import 'package:dream_home/src/db/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';

class CreatePropertyRepo {
  CreatePropertyRepo();

  Future<void> createProperty(
      // String contactNumber,
      // numberController,
      // String propertyName,
      // bool isSelling,

      //List<XFile?> selectedFiles,
      ) async {
    PocketBase pb = await PocketBaseInstance.instance;
    String id = pb.authStore.model.id;

    final body = <String, dynamic>{
      "propertyName": 'berewr house',
      // "isSelling": isSelling,
      "isSelling": true,
      "user": id,
    };

    // List<MultipartFile> convertedFiles = [];

    // for (var file in selectedFiles) {
    //   convertedFiles.add(
    //     MultipartFile.fromBytes(
    //       'images',
    //       await file!.readAsBytes(),
    //       filename: file.name,
    //     ),
    //   );
    // }
    try {
      await pb.collection('properties').create(
          body: body, //files: convertedFiles,
          headers: {
            'token': 'dev',
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
