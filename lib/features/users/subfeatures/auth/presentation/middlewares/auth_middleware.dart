import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/core/services/api_service.dart';

import '../../../../../../core/config/routes.dart';
import '../../data/datasource/local_auth.dart';
import '../../data/datasource/remote_auth.dart';

class AuthMiddleware {
 static FutureOr<String?> Function(BuildContext, GoRouterState)? redirect =
      (context, state) async {
    GetIt.I.registerSingletonAsync(() async {
      final localAuthDataStore = LocalAuthDataStore();
      await localAuthDataStore.init();
      return localAuthDataStore;
    });
    GetIt.I.registerSingleton<RemoteAuthDataSource>(
        RemoteAuthDataSource(apiService: GetIt.instance.get<ApiService>()));
    return Routes.login;
  };
}
