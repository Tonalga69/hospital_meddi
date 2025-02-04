import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/core/config/routes.dart';
import 'package:hospitales_meddi/core/presentation/widgets/appbar.dart';
import 'package:hospitales_meddi/core/presentation/widgets/text_form_field_core.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';
import 'package:hospitales_meddi/core/utils/global_values.dart';

import '../../blocs/login/login_bloc.dart';
import '../../blocs/login/login_event.dart';
import '../../blocs/login/login_state.dart';

class LoginMobilePage extends StatefulWidget {
  const LoginMobilePage({super.key});

  @override
  State<LoginMobilePage> createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCore(),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Iniciar Sesión en Meddi',
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ThemeColors.white
                      : ThemeColors.black),
            ),
            const SizedBox(height: kPadding),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldCore(
                      controller: _usernameController,
                      hintText: 'Usuario',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su usuario';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: kPadding),
                    TextFormFieldCore(
                      obscureText: true,
                      maxLines: 1,
                      controller: _passwordController,
                      hintText: 'Contraseña',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: kPadding),
                    TextButton(
                        onPressed: () {
                          context.go("${Routes.auth}${Routes.signUp}");
                        },
                        child: Text(
                          'No tienes cuenta? Registrate',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: ThemeColors.lightBlue),
                        )),
                  ],
                ),
              ),
            ),
            BlocProvider(
              create: (context) => GetIt.I<LoginBloc>(),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    context.go(Routes.home);
                  }
                  if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: BlocBuilder<LoginBloc,LoginState>(
                  builder: (context, state) =>  ElevatedButton(
                      onPressed: () {
                        if(state is LoginLoading){
                          return;
                        }
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginButtonPressed(
                              email: _usernameController.text.trim(),
                              password: _passwordController.text.trim())
                          );
                        }
                      },
                      child: Text('Iniciar Sesión')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
