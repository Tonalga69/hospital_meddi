import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/data/repositories/user_repository_impl.dart';
import 'package:hospitales_meddi/features/users/domain/entities/user.dart';
import 'package:hospitales_meddi/features/users/domain/repositories/user_repository.dart';

class GetUserUseCase {
  late final UserRepositoryImpl _userRepository;

  GetUserUseCase({UserRepository? userRepository}) {
    _userRepository = GetIt.instance<UserRepositoryImpl>();
  }

  Future<UserEntity> call() async {
    final user = await _userRepository.getCurrentUser();
    return user.toEntity();
  }
}
