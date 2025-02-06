import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitales_meddi/core/presentation/widgets/responsive_builder.dart';
import 'package:hospitales_meddi/features/home/presentation/pages/mobile.dart';
import 'package:hospitales_meddi/features/home/presentation/pages/tablet.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/blocs/get_hospitals.dart';

import '../../../users/presentation/blocs/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetHospitalsCubit()),
        BlocProvider(create: (context) => UserCubit())
      ],
      child: ResponsiveBuilder(
          mobileBuilder: (context) => const HomeMobilePage(),
          tabletBuilder: (context) => const HomeTabletPage()),
    );
  }
}
