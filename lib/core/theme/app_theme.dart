import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.card,
    primaryColor: AppColors.primary,
  );
}
