import 'package:dartz/dartz.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';

abstract class AuthRepository {
  Future<Either<AuthException, void>> login(LoginDto loginDto);

  Future<Either<AuthException, SignUpDto>> signUp(SignUpDto signUpDto);

  Future<void> logout();
}
