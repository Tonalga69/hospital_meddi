import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';
import 'package:hospitales_meddi/features/hospitals/data/repositories/hospital_repository_impl.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';
import 'package:hospitales_meddi/features/users/data/repositories/user_repository_impl.dart';

class GetHospitalsUseCase {
  late final HospitalRepositoryImpl _hospitalRepositoryImpl;
  late final UserRepositoryImpl _userRepositoryImpl;

  GetHospitalsUseCase(
      {HospitalRepositoryImpl? hospitalRepositoryImpl,
      UserRepositoryImpl? userRepositoryImpl}) {
    _hospitalRepositoryImpl =
        hospitalRepositoryImpl ?? GetIt.I.get<HospitalRepositoryImpl>();
    _userRepositoryImpl =
        userRepositoryImpl ?? GetIt.I.get<UserRepositoryImpl>();
  }

  Future<Either<Exception, List<HospitalEntity>>> call(
      GetHospitalParams params) async {
    final token = await _userRepositoryImpl.getToken();
    final result = await _hospitalRepositoryImpl.getAll(params, token);
    return result.fold(
      (l) => left(l),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }
}
