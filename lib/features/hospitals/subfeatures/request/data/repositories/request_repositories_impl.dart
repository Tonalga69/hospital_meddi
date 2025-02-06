import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/create.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/result.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/exceptions/hospital_request.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/repositories/request_repository.dart';

import '../datasource/hospital_request_remote_datasource.dart';

class RequestRepositoryImpl extends RequestRepository {
  final List<CreateHospitalRequestResult> _cache = [];
  late final HospitalRequestRemoteDatasource _remoteDatasource;

  RequestRepositoryImpl({HospitalRequestRemoteDatasource? remoteDatasource}) {
    _remoteDatasource =
        remoteDatasource ?? GetIt.I.get<HospitalRequestRemoteDatasource>();
  }

  @override
  Future<Either<HospitalRequestException, CreateHospitalRequestResult>> createHospitalRequest(
      CreateHospitalRequest request) async {
    final result = await _remoteDatasource.createHospitalRequest(request);
    result.fold((l) => null, (r) => _cache.add(r));
    return result;
  }

  @override
  List<CreateHospitalRequestResult> get cache => _cache;

  @override
  void clearCache() {
    _cache.clear();
  }
}
