import 'package:pocketbase/pocketbase.dart';

/// Extension on [ClientException] to extract the error message from pocketbase
extension ClientExceptionExtension on ClientException {
  String get errorMessage {
    var message = response["message"] ?? "";
    var data = response["data"];
    try {
      data.forEach((key, value) {
        var detailedMessage = value["message"];
        if (detailedMessage != null) {
          message += detailedMessage.toString();
        }
      });
    } catch (_) {}
    try {
      if (originalError != null) {
        message += ' $originalError';
      }
    } catch (_) {}
    return message;
  }
}
