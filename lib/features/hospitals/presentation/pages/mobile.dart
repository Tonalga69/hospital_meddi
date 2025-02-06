import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/core/utils/global_values.dart';

import '../../domain/entities/hospital.dart';

class HospitalDetailsMobilePage extends StatelessWidget {
  const HospitalDetailsMobilePage({super.key, required this.entity});

  final HospitalEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entity.name, style: TextStyle(
        color: Theme.of(context).brightness == Brightness.dark? ThemeColors.white: ThemeColors.dark
      ), )),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(entity.photo, height: 100)),
              const SizedBox(height: 10),
              Center(child: Image.network(entity.logo, height: 50)),
              const SizedBox(height: 20),
              SelectableText('Address: ${entity.address}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Google Maps: ${entity.urlGoogleMaps}',
                  style: const TextStyle(fontSize: 16, color: ThemeColors.lightBlue)),
              SelectableText('Telephone: ${entity.telephone}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Schedule: ${entity.schedule}',
                  style: const TextStyle(fontSize: 16)),
              if (entity.stateCode != null)
                SelectableText('State Code: ${entity.stateCode}',
                    style: const TextStyle(fontSize: 16)),
              SelectableText('Municipality: ${entity.municipality}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Observations: ${entity.observations}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Insurance: ${entity.insurance.join(', ')}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Created At: ${entity.createdAt.toLocal()}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Updated At: ${entity.updatedAt.toLocal()}',
                  style: const TextStyle(fontSize: 16)),
              SelectableText('Disponible: ${entity.enabled ? "Si" : "No"}',
                  style: TextStyle(
                      fontSize: 16,
                      color: entity.enabled ? Colors.green : Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
