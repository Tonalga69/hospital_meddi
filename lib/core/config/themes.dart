
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../utils/colors.dart';
import '../utils/fonts.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: FontFamily.montserrat,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ThemeColors.black,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ThemeColors.black,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ThemeColors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      color: ThemeColors.black,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      color: ThemeColors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 14,
      color: ThemeColors.black,
    ),
    displayLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 24,
      color: ThemeColors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      color: ThemeColors.black,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      color: ThemeColors.black,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ThemeColors.black,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ThemeColors.black,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ThemeColors.black,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 24,
      color: ThemeColors.black,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      color: ThemeColors.black,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      color: ThemeColors.black,
    ),
  ),
  primaryColor: ThemeColors.lightBlue,
  primaryColorLight: ThemeColors.lightBlue,
  cardColor: ThemeColors.white,
  primaryColorDark: ThemeColors.darkerBlue,
  brightness: Brightness.light,
  hintColor: ThemeColors.black.withOpacity(0.5),

  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => const Icon(
        HugeIcons.strokeRoundedArrowLeft02,
        color: ThemeColors.black),
    closeButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedCancel01, color: ThemeColors.black),
    drawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.black),
    endDrawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      iconColor: ThemeColors.black,
      textStyle: const TextStyle(color: ThemeColors.white, fontFamily: FontFamily.montserrat),
      backgroundColor: ThemeColors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: ThemeColors.white,
    ),
  ),
  dividerColor: Colors.white54,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: ThemeColors.primary)
      .copyWith(surface: ThemeColors.white, secondary: ThemeColors.lightBlue,
    onPrimary: ThemeColors.lightBlue, onSecondary: ThemeColors.lighterBlue),
  iconTheme: const IconThemeData(color: ThemeColors.white),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: FontFamily.montserrat,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ThemeColors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ThemeColors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ThemeColors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      color: ThemeColors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      color: ThemeColors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 14,
      color: ThemeColors.white,
    ),
    displayLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 24,
      color: ThemeColors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      color: ThemeColors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      color: ThemeColors.white,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ThemeColors.white,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ThemeColors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ThemeColors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 24,
      color: ThemeColors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 20,
      color: ThemeColors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.montserrat,
      fontSize: 16,
      color: ThemeColors.white,
    ),
  ),
  primaryColor: ThemeColors.white,
  primaryColorLight: ThemeColors.white,
  primaryColorDark: ThemeColors.darkBlue,
  cardColor: ThemeColors.black,
  brightness: Brightness.dark,
  hintColor: ThemeColors.white.withOpacity(0.5),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => const Icon(
        HugeIcons.strokeRoundedArrowLeft02,
        color: ThemeColors.white),
    closeButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedCancel01, color: ThemeColors.white),
    drawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.white),
    endDrawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.white),
  ),
  dividerColor: Colors.black54,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: ThemeColors.primary).copyWith(
      surface: ThemeColors.black,
      brightness: Brightness.dark,
      onPrimary: ThemeColors.dark,
      onSecondary: ThemeColors.dark,
      secondary: ThemeColors.darkBlue),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      iconColor: ThemeColors.black,
      textStyle: const TextStyle(color: ThemeColors.white, fontFamily: FontFamily.montserrat),
      foregroundColor: ThemeColors.white,
      backgroundColor: ThemeColors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  iconButtonTheme:  IconButtonThemeData(style: ButtonStyle(
    iconColor: WidgetStateProperty.all(ThemeColors.white),
  )),
  iconTheme: const IconThemeData(color: ThemeColors.white),
);
