import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';

abstract class AuthRepository {
  Future<void> login(LoginDto loginDto);

  Future<void> signUp(SignUpDto signUpDto);

  Future<void> logout();
}
