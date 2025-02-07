import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/config/routes.dart';
import 'package:hospitales_meddi/core/services/navigation.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';

import '../../../../../hospitals/subfeatures/request/data/repositories/request_repositories_impl.dart';

class AuthException implements Exception {
  final String message;
  final String? debugMessage;

  AuthException(this.message, {this.debugMessage}) {
    debugPrint('AuthException: $message');
  }
}

class UnauthorizedException extends AuthException {
  UnauthorizedException(super.message, {super.debugMessage}) {
    NavigationService.go("${Routes.auth}${Routes.login}");
    GetIt.I.get<RequestRepositoryImpl>().clearCache();
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
