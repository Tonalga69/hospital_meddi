import 'package:hospitales_meddi/core/abstractions/entity.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/login_dto.dart';

class LoginDtoEntity extends CoreEntity<LoginDto> {
  final String username;
  final String password;



  LoginDtoEntity({
    required this.username,
    required this.password,
  });


  @override
  LoginDto toModel() {
    return LoginDto(
      username: username,
      password: password,
    );
  }
}