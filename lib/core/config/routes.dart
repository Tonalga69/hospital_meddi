import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter routes = GoRouter(routes: [
  GoRoute(path: Routes.login,
    builder: (context, state) {
      return Scaffold();
    }
  ),
  GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return Scaffold();
      }),
  GoRoute(path: Routes.signUp,
    builder: (context, state) {
      return Scaffold();
    }
  ),
]);

abstract class Routes {
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String home = '/';
}
