import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/utils/colors.dart';

class AppbarCore extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCore({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.dark?
      ThemeColors.black : ThemeColors.white,
      surfaceTintColor: Theme.of(context).brightness == Brightness.dark?
      ThemeColors.black : ThemeColors.white,
      elevation: 0,
      title: Text(
          'Hospitales Meddi',
          style:  Theme.of(context).textTheme.titleMedium
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
