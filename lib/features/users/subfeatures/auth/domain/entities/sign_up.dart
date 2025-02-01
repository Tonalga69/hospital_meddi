import 'package:hospitales_meddi/core/abstractions/entity.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/models/sign_up_dto.dart';

class SignUpDtoEntity extends CoreEntity<SignUpDto>{

  final String username;
  final String password;
  final String name;
  final String cellphone;

  SignUpDtoEntity({
    required this.username,
    required this.password,
    required this.name,
    required this.cellphone,
  });

  @override
  SignUpDto toModel() {
    return SignUpDto(
      username: username,
      password: password,
      name: name,
      cellphone: cellphone,
    );
  }
}