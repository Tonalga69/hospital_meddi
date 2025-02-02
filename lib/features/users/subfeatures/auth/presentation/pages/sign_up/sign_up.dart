import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/presentation/widgets/responsive_builder.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/pages/sign_up/mobile.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        mobileBuilder: (context) => const SignUpMobilePage(),
        tabletBuilder: (context) => const SignUpMobilePage());
  }
}
