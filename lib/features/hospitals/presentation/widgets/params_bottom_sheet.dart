import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/features/hospitals/data/models/get_hospital_params.dart';

import '../../../../core/presentation/widgets/text_form_field_core.dart';
import '../../../../core/utils/global_values.dart';
import '../../domain/entities/hospital.dart';
import '../blocs/get_hospitals.dart';

class ParamsBottomSheet extends StatelessWidget {
  ParamsBottomSheet({super.key});

  final latController = TextEditingController();
  final longController = TextEditingController();
  final stateCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(kPaddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Campos opcionales"),
            const SizedBox(height: kPadding),
            TextFormFieldCore(
              controller: latController,
              hintText: "Latitud",
              maxLines: 1,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: kPadding),
            TextFormFieldCore(
              controller: longController,
              hintText: "longitud",
              maxLines: 1,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: kPadding),
            TextFormFieldCore(
              controller: stateCodeController,
              hintText: "Codigo de estado",
              maxLines: 1,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: kPadding),
            BlocBuilder<GetHospitalsCubit, List<HospitalEntity>>(
              builder: (context, state) =>  ElevatedButton(
                  onPressed: () {
                    final lat = double.tryParse(latController.text);
                    final long = double.tryParse(longController.text);
                    final stateCode = stateCodeController.text.isEmpty
                        ? null
                        : stateCodeController.text;
                    BlocProvider.of<GetHospitalsCubit>(context).getHospitals(GetHospitalParams(
                        lat: lat, long: long, stateCode: stateCode));
                    Navigator.pop(context);
                  },
                  child: const Text("Buscar")),
            )
          ],
        ),
      ),
    );
  }
}
