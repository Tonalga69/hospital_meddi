import 'package:dartz/dartz.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/data/models/result.dart';

import '../../data/models/create.dart';

abstract class RequestRepository {
  Future<Either<Exception, CreateHospitalRequestResult>> createHospitalRequest(
      CreateHospitalRequest request);

  List<CreateHospitalRequestResult> get cache;

  void clearCache();
}
