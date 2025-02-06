import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/hospitals/data/datasource/remote_hospital_data_source.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/hospital.dart';
import 'package:hospitales_meddi/features/hospitals/domain/repositories/hospital_repository.dart';

class HospitalRepositoryImpl extends HospitalRepository {
  late final RemoteHospitalDataSource _remoteHospitalDataSource;

  HospitalRepositoryImpl({RemoteHospitalDataSource? remoteDataSource}) {
    _remoteHospitalDataSource =
        remoteDataSource ?? GetIt.I.get<RemoteHospitalDataSource>();
  }

  @override
  Future<Either<Exception, List<Hospital>>> getAll(
      GetHospitalParams params, String token) async {
    final result = await _remoteHospitalDataSource.getHospitals(params, token);
    return result.fold(
        (l) => Left(l),
        (r) => Right(r
            .map((e) => Hospital.fromJson(e as Map<String, dynamic>))
            .toList()));
  }
}
