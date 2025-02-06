import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/features/home/presentation/middlewares/home_middleware.dart';
import 'package:hospitales_meddi/features/home/presentation/pages/home.dart';
import 'package:hospitales_meddi/features/hospitals/domain/entities/hospital.dart';
import 'package:hospitales_meddi/features/hospitals/presentation/pages/hospital_details.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/middlewares/auth_middleware.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/middlewares/login_middleware.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/middlewares/sign_up_middleware.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/pages/login/page.dart';
import 'package:hospitales_meddi/features/users/subfeatures/auth/presentation/pages/sign_up/sign_up.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GoRouter routes = GoRouter(
    initialLocation: '${Routes.auth}${Routes.login}',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.auth,
        redirect: AuthMiddleware.redirect,
        routes: [
          GoRoute(
              redirect: LoginMiddleware.redirect,
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
          redirect: HomeMiddleware.redirect,
          builder: (context, state) {
            return const HomePage();
          }),
      GoRoute(
          path: Routes.hospitalDetails,
          redirect: HomeMiddleware.redirect,
          builder: (context, state) {
            final entity = state.extra as HospitalEntity;
            return  HospitalDetailsPage(entity: entity,);
          }),
    ]);

abstract class Routes {
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String home = '/';
  static const String auth = '/auth';
  static const String hospitalDetails= '/hospital-details';
}
