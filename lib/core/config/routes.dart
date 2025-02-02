import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/middlewares/auth_middleware.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/middlewares/sign_up_middleware.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/pages/login/page.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/pages/sign_up/sign_up.dart';

GoRouter routes = GoRouter(
    initialLocation: '${Routes.auth}${Routes.login}',
    routes: [
  GoRoute(
    path: Routes.auth,
    redirect: AuthMiddleware.redirect,
    routes: [
      GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return const LoginPage();
          }),
      GoRoute(
        path: Routes.signUp,
        redirect: SignUpMiddleware.redirect,
        builder: (context, state) {
          return const SignUpPage();
        },
      )
    ],
  ),
  GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return Scaffold();
      }),
]);

abstract class Routes {
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String home = '/';
  static const String auth = '/auth';
}
