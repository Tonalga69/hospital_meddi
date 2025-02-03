import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  late final AuthRepository _authRepository;

  LoginUseCase(AuthRepository? authRepository) {
    _authRepository = authRepository ?? GetIt.I.get<AuthRepository>();
  }

  Future<Either<AuthException, void>> call(LoginDtoEntity params) async {
     return await _authRepository.login(params.toModel());
  }
}
