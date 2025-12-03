import 'package:flutter/material.dart';
import 'package:to_do/core/utils/constants.dart';
import 'app_colors.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
    ),
    
    // Text Theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.lightText,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextSecondary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: AppColors.lightTextSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: AppColors.lightText,
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        side: const BorderSide(color: AppColors.lightBorder, width: 1),
      ),
      elevation: 0,
    ),
    
    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(color: AppColors.lightBorder, width: 1),
      fillColor: WidgetStateProperty.all(AppColors.primary),
      checkColor: WidgetStateProperty.all(AppColors.white),
    ),
    
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      hintStyle: const TextStyle(color: AppColors.lightTextSecondary),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.lightBorder),
        borderRadius: BorderRadius.circular(14),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.lightBorder),
        borderRadius: BorderRadius.circular(14),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      elevation: 0,
      foregroundColor: AppColors.lightText,
    ),
    
    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightIcon,
    ),
    
    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
      space: 20,
    ),
    
    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.lightIcon,
    ),
  );
  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    
    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
    ),
    
    // Text Theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.darkText,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextSecondary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: AppColors.darkTextSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: AppColors.darkText,
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        side: const BorderSide(color: AppColors.darkBorder, width: 1),
      ),
      elevation: 0,
    ),
    
    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(color: AppColors.darkBorder, width: 1),
      fillColor: WidgetStateProperty.all(AppColors.primary),
      checkColor: WidgetStateProperty.all(AppColors.white),
    ),
    
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      hintStyle: const TextStyle(color: AppColors.darkTextSecondary),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.darkBorder),
        borderRadius: BorderRadius.circular(14),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.darkBorder),
        borderRadius: BorderRadius.circular(14),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      elevation: 0,
      foregroundColor: AppColors.darkText,
    ),
    
    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.darkIcon,
    ),
    
    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
      space: 20,
    ),
    
    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.darkIcon,
    ),
  );
}