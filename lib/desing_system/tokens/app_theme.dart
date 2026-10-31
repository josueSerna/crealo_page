import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get ligth {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.backgroundLight,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1,
        headlineLarge: AppTextStyles.h2,
        headlineMedium: AppTextStyles.h3,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.small,
        labelLarge: AppTextStyles.button,
      ),
    );
  }
}
