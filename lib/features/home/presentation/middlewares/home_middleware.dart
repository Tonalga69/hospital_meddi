import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/features/hospitals/data/datasource/remote_hospital_data_source.dart';
import 'package:hospitales_meddi/features/hospitals/data/repositories/hospital_repository_impl.dart';
import 'package:hospitales_meddi/features/hospitals/domain/usecases/get_hospitals.dart';
import 'package:hospitales_meddi/features/users/data/repositories/user_repository_impl.dart';
import 'package:hospitales_meddi/features/users/domain/usecases/get_token.dart';
import 'package:hospitales_meddi/features/users/domain/usecases/get_user.dart';
import 'package:hospitales_meddi/features/users/domain/usecases/set_token.dart';

abstract class HomeMiddleware {
  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirect =
      (context, state) {
    if (!GetIt.I.isRegistered<UserRepositoryImpl>()) {
      GetIt.I.registerSingleton<UserRepositoryImpl>(UserRepositoryImpl());
    }
    if (!GetIt.I.isRegistered<RemoteHospitalDataSource>()) {
      GetIt.I.registerSingleton(RemoteHospitalDataSource());
    }
    if (!GetIt.I.isRegistered<HospitalRepositoryImpl>()) {
      GetIt.I.registerSingleton(HospitalRepositoryImpl());
    }
    if (!GetIt.I.isRegistered<GetHospitalsUseCase>()) {
      GetIt.I.registerSingleton(GetHospitalsUseCase());
    }

    if (!GetIt.I.isRegistered<GetUserUseCase>()) {
      GetIt.I.registerSingleton<GetUserUseCase>(GetUserUseCase());
    }
    if (!GetIt.I.isRegistered<GetTokenUseCase>()) {
      GetIt.I.registerSingleton<GetTokenUseCase>(GetTokenUseCase());
    }
    if (GetIt.I.isRegistered<SetTokenUseCase>()) {
      GetIt.I.registerSingleton<SetTokenUseCase>(SetTokenUseCase());
    }

    return null;
  };
}
