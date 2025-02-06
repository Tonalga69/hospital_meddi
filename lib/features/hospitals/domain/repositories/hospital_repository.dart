import 'package:dartz/dartz.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/hospital.dart';

abstract class HospitalRepository {

  Future<Either<Exception, List<Hospital>>> getAll(GetHospitalParams params, String token);
}