import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/entities/result.dart';

import '../../data/repositories/request_repositories_impl.dart';

class RequestListCubit extends Cubit<List<CreateHospitalRequestResultEntity>> {
  late final RequestRepositoryImpl _requestRepository;
  RequestListCubit({RequestRepositoryImpl? requestRepository}):super([]){
    _requestRepository = requestRepository ?? GetIt.I.get<RequestRepositoryImpl>();
    getRequests();
  }



  void getRequests(){
    final result = _requestRepository.cache.map((e) => e.toEntity()).toList();
    emit(result);
  }

}