import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message) {
    debugPrint('AuthException: $message');
  }
}
