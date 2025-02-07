import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/core/presentation/widgets/appbar.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/core/utils/global_values.dart';
import 'package:hospitales_meddi/features/home/presentation/widgets/drawer.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/pagers/hospitals_list.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/entities/result.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/presentation/blocs/request_list.dart';

class HomeTabletPage extends StatelessWidget {
  const HomeTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerHome(),
        appBar: const AppbarCore(),
        body: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Row(
            children: [
              const Expanded(child: HospitalsListSection()),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "Solicitudes",
                    ),
                    Expanded(child: BlocBuilder<RequestListCubit,
                        List<CreateHospitalRequestResultEntity>>(
                      builder: (BuildContext context,
                          List<CreateHospitalRequestResultEntity> state) {
                        return ListView.builder(
                          itemCount: state.length,
                          itemBuilder: (context, index) => Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: kPaddingS),
                              padding: const EdgeInsets.all(kPaddingS),
                              decoration: BoxDecoration(
                                color: ThemeColors.darkBlue,
                                borderRadius:
                                BorderRadius.circular(kCornerRadius),
                              ),
                              child: Column(
                                children: [
                                  Text("Id de solicitud: ${state[index].id}"),
                                  Text(
                                      "Solicitado el: ${state[index].createdAt.toIso8601String()}"),
                                ],
                              )),
                        );
                      },
                    )),
                    ElevatedButton(
                        onPressed: () {
                          context.read<RequestListCubit>().getRequests();
                        },
                        child: const Text("Recargar"))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
