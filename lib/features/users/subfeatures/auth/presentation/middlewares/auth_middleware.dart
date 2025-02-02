import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/repositories/auth_repository_impl.dart';

import '../../data/datasource/local_auth.dart';
import '../../data/datasource/remote_auth.dart';

class AuthMiddleware {
  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirect =
      (context, state) async {
    if (!GetIt.I.isRegistered<LocalAuthDataStore>()) {
       GetIt.I.registerSingletonAsync(() async {
        final localAuthDataStore = LocalAuthDataStore();
        await localAuthDataStore.init();
        return localAuthDataStore;
      });
    }
    if (!GetIt.I.isRegistered<RemoteAuthDataSource>()) {
      GetIt.I.registerSingleton(RemoteAuthDataSource());
    }
    if (!GetIt.I.isRegistered<AuthRepositoryImpl>()) {
      GetIt.I.registerLazySingleton(() => AuthRepositoryImpl());
    }
    return null;
  };
}
