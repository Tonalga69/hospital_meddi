import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/presentation/widgets/responsive_builder.dart';
import 'package:hospitales_meddi/features/home/presentation/pages/mobile.dart';
import 'package:hospitales_meddi/features/home/presentation/pages/tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        mobileBuilder: (context) => const HomeMobilePage(),
        tabletBuilder: (context) => const HomeTabletPage());
  }
}
