import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/presentation/widgets/appbar.dart';
import 'package:hospitales_meddi/features/home/presentation/widgets/drawer.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';

import '../../../hospitals/presentation/blocs/get_hospitals.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<GetHospitals>(),
      child: Scaffold(
          drawer: const DrawerHome(),
          appBar: const AppbarCore(),
          body: Column(
            children: [
              BlocBuilder<GetHospitals, List<HospitalEntity>>(
                builder: (context, state) => Expanded(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return Text("${state[index].name}");
                    },
                  ),
                ),
              ),
              FloatingActionButton(onPressed: () {
                GetIt.I.get<GetHospitals>().getHospitals(GetHospitalParams());
              }),
            ],
          )),
    );
  }
}
