import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/usecases/sign_up.dart';

abstract class SignUpMiddleware {
  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirect =
      (context, state){
    if (!GetIt.I.isRegistered<SignUpUseCase>()) {
      GetIt.I.registerSingleton(SignUpUseCase());
    }
    return null;
  };
}