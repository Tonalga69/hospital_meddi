import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/core/utils/global_values.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/domain/usecases/request_hospital.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/presentation/blocs/event.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/presentation/blocs/request.dart';
import 'package:hospitales_meddi/features/hospitals/subfeatures/request/presentation/blocs/state.dart';
import 'package:hugeicons/hugeicons.dart';

class RequestAlertDialog extends StatelessWidget {
  const RequestAlertDialog({super.key, required this.selectedHospitalId});

  final String selectedHospitalId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestBloc(GetIt.I.get<RequestHospitalUseCase>()),
      child: BlocListener<RequestBloc, RequestState>(
        listener: (context, state) {
          if (state is RequestSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Se ha solicitado el hospital")),
            );
          }
          if (state is RequestErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<RequestBloc, RequestState>(
          builder: (BuildContext context, RequestState state) => AlertDialog(
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.dark
                : ThemeColors.white,
            icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedAlert01,
                color: ThemeColors.darkBlue),
            content: state is RequestLoadingState
                ? SizedBox(
                    height: kIconSizeM,
                    width: kIconSizeM,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ThemeColors.white
                            : ThemeColors.dark,
                      ),
                    ),
                  )
                : const Text("¿Desea solicitar el hospital?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (state is RequestLoadingState) {
                      return;
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar")),
              ElevatedButton(
                  onPressed: () {
                    if (state is RequestLoadingState) {
                      return;
                    }
                    context
                        .read<RequestBloc>()
                        .add(RequestHospitalEventRequested(selectedHospitalId));
                  },
                  child: const Text("Solicitar"))
            ],
          ),
        ),
      ),
    );
  }
}
