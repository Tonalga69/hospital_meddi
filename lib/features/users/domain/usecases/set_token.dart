import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/data/repositories/user_repository_impl.dart';

class SetTokenUseCase{
  late final UserRepositoryImpl _userRepository;

  SetTokenUseCase({UserRepositoryImpl? userRepositoryImpl}){
    _userRepository = userRepositoryImpl ?? GetIt.I.get<UserRepositoryImpl>();
  }

  Future<void> call(String token) async{
    return await _userRepository.saveToken(token);
  }
}
