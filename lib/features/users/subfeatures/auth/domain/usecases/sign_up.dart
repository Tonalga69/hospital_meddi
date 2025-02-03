
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/data/repositories/auth_repository_impl.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/entities/sign_up.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/exceptions/auth_exception.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase{
  late final AuthRepository authRepository;

  SignUpUseCase({AuthRepository? authRepository}){
    this.authRepository = authRepository ?? GetIt.I.get<AuthRepositoryImpl>();
  }

  Future<Either<AuthException, SignUpDtoEntity>> signUp(SignUpDtoEntity params) async {
    final model = params.toModel();
    final result = await authRepository.signUp(model);
    return result.fold((l) => Left(l), (r) => Right(r.toEntity()));
  }

}