import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/injection/service_locator.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/datasource/remote_auth.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/repositories/auth_repository.dart';

import '../datasource/local_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  late final RemoteAuthDataSource _remoteAuthDataSource;
  late final LocalAuthDataStore _localAuthDataStore;

  AuthRepositoryImpl(
      {RemoteAuthDataSource? remoteAuthDataSource,
      LocalAuthDataStore? localAuthDataStore}) {
    _remoteAuthDataSource =
        remoteAuthDataSource ?? GetIt.I.get<RemoteAuthDataSource>();
    _localAuthDataStore =
        localAuthDataStore ?? GetIt.I.get<LocalAuthDataStore>();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, SignUpDto>> signUp(SignUpDto signUpDto) async {
    final result = await _remoteAuthDataSource.signUp(signUpDto);
    await login(
        LoginDto(username: signUpDto.username, password: signUpDto.password));
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<AuthException, void>> login(LoginDto loginDto) async {
    try {
      final result = await _remoteAuthDataSource.login(loginDto);
      return result.fold(
        (l) => Left(l), // Return the error directly
        (token) async {
          await _localAuthDataStore.saveAccount(loginDto);
          await ServiceLocator.instanceLocalDatabaseService(
              loginDto.username, token);
          return const Right(null);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      return Left(AuthException("Las credenciales son incorrectas"));
    }
  }
}
