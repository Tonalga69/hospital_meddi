import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/presentation/widgets/responsive_builder.dart';

import 'mobile.dart';
import 'tablet.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (context) => const LoginMobilePage(),
      tabletBuilder: (context) => const LoginTabletPage(),
    );
  }
}
