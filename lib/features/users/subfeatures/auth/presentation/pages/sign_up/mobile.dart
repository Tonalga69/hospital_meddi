import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/core/config/routes.dart';
import 'package:hospitales_meddi/core/presentation/widgets/appbar.dart';
import 'package:hospitales_meddi/core/presentation/widgets/text_form_field_core.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/core/utils/global_values.dart';
import 'package:hospitales_meddi/core/utils/regex.dart';
import 'package:hugeicons/hugeicons.dart';

class SignUpMobilePage extends StatefulWidget {
  const SignUpMobilePage({super.key});

  @override
  State<SignUpMobilePage> createState() => _SignUpMobilePageState();
}

class _SignUpMobilePageState extends State<SignUpMobilePage> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).brightness == Brightness.dark
        ? ThemeColors.white
        : ThemeColors.dark;
    return Scaffold(
      appBar: const AppbarCore(),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Registro',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldCore(
                        validator: (value) {
                          value = value?.trim();
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su email';
                          }
                          if (!value.isValidEmail()) {
                            return 'Por favor ingrese un email válido';
                          }
                          return null;
                        },
                        labelText: 'Email',
                        hintText: 'email@example.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: HugeIcon(
                            icon: HugeIcons.strokeRoundedMail01,
                            color: iconColor),
                      ),
                      const SizedBox(height: 16),
                      TextFormFieldCore(
                        controller: passwordController,
                        validator: (value) {
                          value = value?.trim();
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su contraseña';
                          }
                          if (value.length < 4) {
                            return 'La contraseña debe tener al menos 4 caracteres';
                          }
                          if (confirmPasswordController.text !=
                              passwordController.text) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                        labelText: 'Contraseña',
                        hintText: '********',
                        obscureText: true,
                        maxLines: 1,
                        prefixIcon: HugeIcon(
                            icon: HugeIcons.strokeRoundedLock,
                            color: iconColor),
                      ),
                      const SizedBox(height: 16),
                      TextFormFieldCore(
                        controller: confirmPasswordController,
                        validator: (value) {
                          value = value?.trim();
                          if (value == null || value.isEmpty) {
                            return 'Por favor confirme su contraseña';
                          }
                          if (confirmPasswordController.text !=
                              passwordController.text) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                        labelText: 'Confirmar contraseña',
                        hintText: '********',
                        prefixIcon: HugeIcon(
                            icon: HugeIcons.strokeRoundedLock,
                            color: iconColor),
                      ),
                      TextFormFieldCore(
                        validator: (value) {
                          value = value?.trim();
                          if (value == null || value.isEmpty) {
                            return 'El nombre no puede estar vacío';
                          }
                          return null;
                        },
                        labelText: 'Nombre',
                        hintText: 'John Doe',
                        prefixIcon: HugeIcon(
                            icon: HugeIcons.strokeRoundedUser,
                            color: iconColor),
                      ),
                      const SizedBox(height: 16),
                      TextFormFieldCore(
                        validator: (value) {
                          value = value?.trim();
                          if (value == null || value.isEmpty) {
                            return 'El Celular no puede estar vacío';
                          }
                          if (!value.isValidPhone()) {
                            return 'Por favor ingrese un celular válido, máximo 10 digitos';
                          }
                          return null;
                        },
                        labelText: 'Celular',
                        hintText: '1234567890',
                        keyboardType: TextInputType.phone,
                        prefixIcon: HugeIcon(
                            icon: HugeIcons.strokeRoundedCall,
                            color: iconColor),
                      ),
                      const SizedBox(height: 24),
                      Center(
                          child: TextButton(
                              onPressed: () {
                                context.go("${Routes.auth}${Routes.login}");
                              },
                              child: Text('Ya tienes una cuenta? Inicia sesión',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: ThemeColors.lightBlue,
                                      )))),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go(Routes.home);
                  }
                },
                child: Text("Registrarse",
                    style: Theme.of(context).textTheme.labelMedium)),
          ],
        ),
      ),
    );
  }
}
