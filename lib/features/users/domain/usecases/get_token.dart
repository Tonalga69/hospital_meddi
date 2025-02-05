import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/data/repositories/user_repository_impl.dart';

class GetTokenUseCase {

  late final UserRepositoryImpl _userRepository;

  GetTokenUseCase({UserRepositoryImpl? authRepositoryImpl}) {
    _userRepository = authRepositoryImpl ?? GetIt.instance<UserRepositoryImpl>();
  }
  Future<String> call() async {
    return await _userRepository.getToken();
  }
}