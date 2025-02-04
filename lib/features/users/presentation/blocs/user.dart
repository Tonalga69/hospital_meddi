import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/domain/entities/user.dart';
import 'package:hospitales_meddi/features/users/domain/usecases/get_user.dart';

class UserCubit extends Cubit<UserEntity?> {
  late final GetUserUseCase _getUserUseCase;

  UserCubit({GetUserUseCase? getUserUseCase}): super(null){
    _getUserUseCase = getUserUseCase ?? GetIt.instance<GetUserUseCase>();
    getUser();
  }

  void getUser() async {
    final user = await _getUserUseCase();
    emit(user);
  }
}