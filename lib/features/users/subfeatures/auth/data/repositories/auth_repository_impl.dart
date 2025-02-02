import 'package:hospitales_meddi/features/users/subfeatures/auth/data/datasource/remote_auth.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/repositories/auth_repository.dart';

import '../datasource/local_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  late final RemoteAuthDataSource _remoteAuthDataSource;
  late final LocalAuthDataStore _localAuthDataStore;

  AuthRepositoryImpl(this._remoteAuthDataSource, this._localAuthDataStore);

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
  Future<void> signUp(SignUpDto signUpDto) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}
