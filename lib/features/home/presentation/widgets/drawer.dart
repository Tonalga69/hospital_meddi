import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/core/utils/global_values.dart';
import 'package:hospitales_meddi/features/users/domain/entities/user.dart';
import 'package:hospitales_meddi/features/users/presentation/blocs/user.dart';

import '../../../users/subfeatures/auth/domain/usecases/logout.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? ThemeColors.dark
          : ThemeColors.white,
      child: DrawerHeader(
          child: BlocBuilder<UserCubit, UserEntity?>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(kPaddingS),
          child: Column(
            children: [
              Expanded(
                child: Text("Usuario: ${state?.username}",
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? ThemeColors.white
                            : ThemeColors.dark)),
              ),
              ElevatedButton(onPressed: (){
                LogoutUseCase().call();
              }, child: Text("Cerrar sesión"))
            ],
          ),
        ),
      )),
    );
  }
}
