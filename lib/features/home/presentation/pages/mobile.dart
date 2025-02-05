import 'package:flutter/material.dart';
import 'package:hospitales_meddi/core/presentation/widgets/appbar.dart';
import 'package:hospitales_meddi/features/home/presentation/widgets/drawer.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerHome(),
        appBar: const AppbarCore(),
        body: Column(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return Container();
              },
            )
          ],
        ));
  }
}
