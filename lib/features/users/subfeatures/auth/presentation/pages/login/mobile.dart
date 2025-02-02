import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospitales_meddi/core/config/routes.dart';
import 'package:hospitales_meddi/core/presentation/widgets/appbar.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';

class LoginMobilePage extends StatelessWidget {
  const LoginMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCore(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(
            child: Column(
              children: [
                Text(
                  'Login Page',
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemeColors.white
                          : ThemeColors.black),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Login')),
          ElevatedButton(onPressed: (){
            context.go("${Routes.auth}${Routes.signUp}");
          }, child: Text('Sign Up')),
        ],
      ),
    );
  }
}
