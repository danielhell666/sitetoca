
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: base.textTheme.apply(
        fontFamily: 'Poppins',
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      ),
    );
  }
}
