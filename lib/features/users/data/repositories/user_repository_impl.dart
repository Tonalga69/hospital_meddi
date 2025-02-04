
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/data/datasource/local_user.dart';
import 'package:hospitales_meddi/features/users/data/models/user.dart';
import 'package:hospitales_meddi/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  late final LocalUserDataSource _localUserDataSource;

  UserRepositoryImpl({LocalUserDataSource? localUserDataSource}){
    _localUserDataSource = localUserDataSource ?? GetIt.I.get<LocalUserDataSource>();
    getCurrentUser();
  }
  @override
  Future<User> getCurrentUser() async{
    return await _localUserDataSource.getUser();
  }

  @override
  Future<void> saveUser(User user) {
    return _localUserDataSource.saveUser(user);
  }
}