import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/blocs/get_hospitals.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/widgets/hospital_item.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/widgets/params_bottom_sheet.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/utils/colors.dart';

class HospitalsListSection extends StatefulWidget {
  const HospitalsListSection({super.key});

  @override
  State<HospitalsListSection> createState() => _HospitalsListState();
}

class _HospitalsListState extends State<HospitalsListSection> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        context.read<GetHospitalsCubit>().getMoreHospitals();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Theme
                      .of(context)
                      .colorScheme
                      .surface,
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                        value: context.read<GetHospitalsCubit>(),
                        child: ParamsBottomSheet());
                  },
                );
              },
              label: const Text("Filtros"),
              icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedFilter,
                  color: ThemeColors.white),
            )
          ],
        ),
        BlocBuilder<GetHospitalsCubit, List<HospitalEntity>>(
          builder: (context, state) =>
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return HospitalItem(entity: state[index]);
                  },
                ),
              ),
        ),
      ],
    );
  }
}
