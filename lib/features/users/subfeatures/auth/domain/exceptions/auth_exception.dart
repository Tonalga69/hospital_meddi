import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospitales_meddi/core/config/routes.dart';
import 'package:hospitales_meddi/core/services/navigation.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';

class AuthException implements Exception {
  final String message;
  final String? debugMessage;

  AuthException(this.message, {this.debugMessage}) {
    debugPrint('AuthException: $message');
  }
}

class UnauthorizedException extends AuthException {
  UnauthorizedException(super.message, {super.debugMessage}) {
    NavigationService.push("${Routes.auth}/${Routes.login}");
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColors.black,
        textColor: ThemeColors.white,
        fontSize: 16.0);
  }
}
