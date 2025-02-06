import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';
import 'package:hospitales_meddi/features/hospitals/domain/usecases/get_hospitals.dart';

class GetHospitals extends Cubit<List<HospitalEntity>> {
  late final GetHospitalsUseCase _getHospitalsUseCase;
  GetHospitalParams params = GetHospitalParams();
  bool _canLoadMore = true;

  GetHospitals({GetHospitalsUseCase? getHospitalsUseCase}) : super([]) {
    _getHospitalsUseCase =
        getHospitalsUseCase ?? GetIt.I.get<GetHospitalsUseCase>();
    getHospitals(params);
  }

  Future<void> getHospitals(GetHospitalParams params) async {
    final result = await _getHospitalsUseCase.call(params);
    result.fold((l) => debugPrint(l.toString()), (r)=> debugPrint(r.length.toString()));
    result.fold((l) => emit([]), (r) => emit(r));
  }

  void getMoreHospitals() async {
    if (!_canLoadMore) return;
    params = params.copyWith(page: params.page + 1);
    final result = await _getHospitalsUseCase.call(params);
    result.fold((l) => emit([]), (r) {
      if (r.isEmpty) {
        _canLoadMore = false;
      }
      emit([...state, ...r]);
    });
  }
}
