import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/repositories/auth_repository_impl.dart';

class LogoutUseCase {
  late final AuthRepositoryImpl _authRepository;

  LogoutUseCase({AuthRepositoryImpl? authRepository}){
    _authRepository = authRepository ?? GetIt.I.get<AuthRepositoryImpl>();

  }

  Future<void> call()async{
    _authRepository.logout();
  }
}