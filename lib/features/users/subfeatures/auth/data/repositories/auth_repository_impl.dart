import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/datasource/remote_auth.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/repositories/auth_repository.dart';

import '../datasource/local_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  late final RemoteAuthDataSource _remoteAuthDataSource;
  late final LocalAuthDataStore _localAuthDataStore;

  AuthRepositoryImpl({RemoteAuthDataSource? remoteAuthDataSource, LocalAuthDataStore? localAuthDataStore}) {
    _remoteAuthDataSource = remoteAuthDataSource ?? GetIt.I.get<RemoteAuthDataSource>();
    _localAuthDataStore = localAuthDataStore ?? GetIt.I.get<LocalAuthDataStore>();
  }

  @override
  Future<void> login(LoginDto loginDto) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthException, SignUpDto>> signUp(SignUpDto signUpDto) async{
    final result= await _remoteAuthDataSource.signUp(signUpDto);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

}
