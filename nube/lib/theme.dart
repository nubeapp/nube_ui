import 'package:flutter/material.dart';

abstract class AppColors {
  static const backgroundLight = Color(0xFFFFFFFF);
  static const backgroundDark = Color(0xFF141414);

  static const inputFieldBackgroundLight = Color.fromARGB(255, 237, 241, 255);
  static const inputFieldBackgroundDark = Color(0xFF212121);

  static const textLight = Color(0xFF797979);
  static const textDark = Color(0xFFFFFFFF);

  static const iconLight = Color(0xFF797979);
  static const iconDark = Color(0xFF797979);

  static const accentLight = Color(0xFF3561FE);
  static const accentDark = Color.fromARGB(255, 57, 98, 245);

  static const error = Color.fromARGB(255, 253, 66, 91);

  static const inputTextLight = Color(0xFF1E1E1E);
  static const inputTextDark = Color(0xFFFFFFFF);

  static const inputFieldError = Color.fromARGB(33, 255, 54, 64);
}

abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData light() => ThemeData(
      brightness: Brightness.light,
      accentColor: _LightColors.accent,
      visualDensity: visualDensity,
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: AppColors.textLight,
        ),
      ),
      backgroundColor: _LightColors.background,
      scaffoldBackgroundColor: _LightColors.background,
      cardColor: _LightColors.input,
      iconTheme: const IconThemeData(color: AppColors.iconLight),
      errorColor: AppColors.error,
      cursorColor: AppColors.inputTextLight,
      primaryColor: AppColors.textLight);

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        accentColor: _DarkColors.accent,
        visualDensity: visualDensity,
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: AppColors.textDark,
          ),
        ),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.input,
        iconTheme: const IconThemeData(color: AppColors.iconDark),
        errorColor: AppColors.error,
        cursorColor: AppColors.inputTextDark,
        primaryColor: AppColors.textDark,
      );
}

abstract class _LightColors {
  static const background = AppColors.backgroundLight;
  static const input = AppColors.inputFieldBackgroundLight;
  static const accent = AppColors.accentLight;
}

abstract class _DarkColors {
  static const background = AppColors.backgroundDark;
  static const input = AppColors.inputFieldBackgroundDark;
  static const accent = AppColors.accentDark;
}
