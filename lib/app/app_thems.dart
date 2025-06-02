import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';

class AppThemes {
  static ThemeData get lightThemsData {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black54)),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
        hintStyle: const TextStyle(
            color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        fillColor: Colors.white,
        enabledBorder: outlineBorder(AppColors.themeColor),
        errorBorder: outlineBorder(Colors.red),
        border: outlineBorder(AppColors.themeColor),
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.getMaterialColor(AppColors.themeColor)),
      textTheme: _textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
          backgroundColor: AppColors.themeColor,
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  static OutlineInputBorder outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: color),
    );
  }

  static TextTheme get _textTheme {
    return const TextTheme(
      titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          letterSpacing: 0.4),
      titleMedium: TextStyle(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontSize: 18, color: Colors.green, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}
