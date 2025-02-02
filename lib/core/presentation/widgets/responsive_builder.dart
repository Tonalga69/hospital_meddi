import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext) mobileBuilder;
  final Widget Function(BuildContext) tabletBuilder;

  const ResponsiveBuilder({
    super.key,
    required this.mobileBuilder,
    required this.tabletBuilder,
  });

  static const double _tabletBreakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    if (screenWidth >= _tabletBreakpoint && screenHeight >= _tabletBreakpoint) {
      return tabletBuilder(context);
    } else {
      return mobileBuilder(context);
    }
  }
}