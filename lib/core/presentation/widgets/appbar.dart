import 'package:flutter/material.dart';

class AppbarCore extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCore({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(
          'Hospitales Meddi',
          style:  Theme.of(context).textTheme.titleMedium
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
