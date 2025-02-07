import 'package:flutter/foundation.dart';

class HospitalRequestException implements Exception {
  final String message;
  final String? debugMessage;

  HospitalRequestException(this.message, [this.debugMessage]){
    debugPrint("HospitalRequestException: $debugMessage");
  }
}
