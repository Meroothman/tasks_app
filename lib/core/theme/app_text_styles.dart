import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Light Theme Text Styles
  static TextStyle lightHeadline32(BuildContext context) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.headlineLarge?.color ?? AppColors.lightText,
  );
  
  static TextStyle lightTitle20(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).textTheme.titleLarge?.color ?? AppColors.lightText,
  );
  
  static TextStyle lightSubtitle14(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyMedium?.color ?? AppColors.lightTextSecondary,
  );
  
  static TextStyle lightTaskTitle(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.lightText,
  );
  
  static TextStyle lightTaskDescription(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Theme.of(context).textTheme.bodySmall?.color ?? AppColors.lightTextSecondary,
  );
  
  static TextStyle lightPercentage(BuildContext context) => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.labelLarge?.color ?? AppColors.lightText,
  );
  
  // Dark Theme Text Styles
  static TextStyle darkHeadline32(BuildContext context) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.headlineLarge?.color ?? AppColors.darkText,
  );
  
  static TextStyle darkTitle20(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).textTheme.titleLarge?.color ?? AppColors.darkText,
  );
  
  static TextStyle darkSubtitle14(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyMedium?.color ?? AppColors.darkTextSecondary,
  );
  
  static TextStyle darkTaskTitle(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.darkText,
  );
  
  static TextStyle darkTaskDescription(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Theme.of(context).textTheme.bodySmall?.color ?? AppColors.darkTextSecondary,
  );
  
  static TextStyle darkPercentage(BuildContext context) => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.labelLarge?.color ?? AppColors.darkText,
  );
  
  // Common Text Styles
  static TextStyle authHeadline(BuildContext context) => TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).brightness == Brightness.dark 
        ? AppColors.darkText 
        : AppColors.lightText,
  );
  
  static TextStyle authSubtitle(BuildContext context) => TextStyle(
    fontSize: 16,
    color: Theme.of(context).brightness == Brightness.dark 
        ? AppColors.darkTextSecondary 
        : AppColors.lightText,
  );
  
  static TextStyle pageTitle(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).brightness == Brightness.dark 
        ? AppColors.darkText 
        : AppColors.lightText,
  );
  
  static TextStyle sectionTitle(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).brightness == Brightness.dark 
        ? AppColors.darkText 
        : AppColors.lightText,
  );
  
  static TextStyle profileLabel(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).brightness == Brightness.dark 
        ? AppColors.darkTextSecondary 
        : AppColors.lightTextSecondary,
  );
}