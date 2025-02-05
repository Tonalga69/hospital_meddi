import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  final String message;
  final String? debugMessage;
  AuthException(this.message, {this.debugMessage}) {
    debugPrint('AuthException: $message');
  }
}

class UnauthorizedException extends AuthException{
  UnauthorizedException(super.message, {super.debugMessage});
}
