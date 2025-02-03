import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/usecases/login.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/blocs/login/login_bloc.dart';

abstract class LoginMiddleware {
  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirect =
      (context, state){
    if(GetIt.I.isRegistered<LoginUseCase>()){
      GetIt.I.unregister<LoginUseCase>();
    }
    if(GetIt.I.isRegistered<LoginBloc>()){
      GetIt.I.unregister<LoginBloc>();
    }

    return null;
      };
}