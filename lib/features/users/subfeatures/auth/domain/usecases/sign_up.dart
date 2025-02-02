
import 'package:dartz/dartz.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/sign_up.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase{
  final AuthRepository authRepository;
  SignUpUseCase(this.authRepository);

  Future<Either<AuthException, SignUpDtoEntity>> signUp(SignUpDtoEntity params) {
    throw UnimplementedError();
  }

}