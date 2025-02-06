import 'package:flutter/foundation.dart';

class HospitalException implements Exception {
  final String message;
  final String? debugMessage;

  HospitalException({required this.message, this.debugMessage}) {
    debugPrint('Hospital exception: $debugMessage');
  }
}

