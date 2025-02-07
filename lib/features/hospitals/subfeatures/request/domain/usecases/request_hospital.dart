import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/create.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/repositories/request_repositories_impl.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/entities/result.dart';
import 'package:hospitales_meddi/features/users/data/repositories/user_repository_impl.dart';

import '../exceptions/hospital_request.dart';

class RequestHospitalUseCase {
  late final UserRepositoryImpl _userRepository;
  late final RequestRepositoryImpl _requestRepository;

  RequestHospitalUseCase(
      {UserRepositoryImpl? userRepository,
      RequestRepositoryImpl? requestRepository}) {
    _userRepository = userRepository ?? GetIt.I.get<UserRepositoryImpl>();
    _requestRepository =
        requestRepository ?? GetIt.I.get<RequestRepositoryImpl>();
  }

  Future<Either<HospitalRequestException, CreateHospitalRequestResultEntity>> call(
      String id) async {
    final token = await _userRepository.getToken();
    final result = await _requestRepository.createHospitalRequest(
        CreateHospitalRequest(token: token, hospitalId: id));
    return result.fold(
      (l) => Left(l),
      (r) => Right(
        r.toEntity(),
      ),
    );
  }
}
