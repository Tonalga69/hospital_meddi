import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/repositories/auth_repository_impl.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';

class LoginUseCase {
  late final AuthRepositoryImpl _authRepository;

  LoginUseCase({AuthRepositoryImpl? authRepository}) {
    _authRepository = authRepository ?? GetIt.I.get<AuthRepositoryImpl>();
  }

  Future<Either<AuthException, void>> call(LoginDtoEntity params) async {
     return await _authRepository.login(params.toModel());
  }
}
