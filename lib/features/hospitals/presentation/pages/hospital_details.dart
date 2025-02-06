import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/presentation/widgets/responsive_builder.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/pages/mobile.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/pages/tablet.dart';

import '../../domain/entities/hospital.dart';

class HospitalDetailsPage extends StatelessWidget {
  const HospitalDetailsPage({super.key, required this.entity});

  final HospitalEntity entity;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (p0) => HospitalDetailsMobilePage(
        entity: entity,
      ),
      tabletBuilder: (p0) => HospitalDetailsTabletPage(
        entity: entity,
      ),
    );
  }
}
