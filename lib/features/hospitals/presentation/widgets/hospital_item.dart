import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';

import '../../../../core/config/routes.dart';
import '../../../../core/utils/global_values.dart';

class HospitalItem extends StatelessWidget {
  const HospitalItem({super.key, required this.entity});

  final HospitalEntity entity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Routes.hospitalDetails, extra: entity);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: kPaddingS),
          padding: const EdgeInsets.all(kPaddingS),
          decoration: BoxDecoration(
            color: ThemeColors.darkBlue,
            borderRadius: BorderRadius.circular(kCornerRadius),
          ),
          child: Row(
            children: [
              SizedBox(
                  width: kIconSize,
                  height: kIconSize,
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        color: ThemeColors.error,
                        size: kIconSize),
                    entity.logo,
                    filterQuality: FilterQuality.low,
                  )),
              SizedBox(
                width: kPaddingS,
              ),
              Expanded(child: Text(entity.name, style: const TextStyle(
                color: ThemeColors.white
              ),)),
            ],
          )),
    );
  }
}
