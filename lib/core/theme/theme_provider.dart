import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/app_theme.dart';
import 'package:to_do/core/utils/constants.dart';

import '../cache/cache_consumer.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final CacheConsumer _cache;
  
  ThemeProvider(this._cache) {
    _loadTheme();
  }
  
  ThemeMode get themeMode => _themeMode;
  
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  
  void _loadTheme() async {
    final themeData = _cache.getData(key: AppConstants.themeModeKey);
    if (themeData == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (themeData == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
  
  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _cache.saveData(
      key: AppConstants.themeModeKey,
      value: isDark ? 'dark' : 'light',
    );
    notifyListeners();
  }
  
  ThemeData get currentTheme {
    return _themeMode == ThemeMode.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
  
  Color get backgroundColor {
    return _themeMode == ThemeMode.dark 
        ? AppColors.darkBackground 
        : AppColors.lightBackground;
  }
  
  Color get cardColor {
    return _themeMode == ThemeMode.dark 
        ? AppColors.darkCard 
        : AppColors.lightCard;
  }
  
  Color get textColor {
    return _themeMode == ThemeMode.dark 
        ? AppColors.darkText 
        : AppColors.lightText;
  }
  
  Color get textSecondaryColor {
    return _themeMode == ThemeMode.dark 
        ? AppColors.darkTextSecondary 
        : AppColors.lightTextSecondary;
  }
  
  Color get borderColor {
    return _themeMode == ThemeMode.dark 
        ? AppColors.darkBorder 
        : AppColors.lightBorder;
  }
  
  Color get surfaceColor {
    return _themeMode == ThemeMode.dark 
        ? AppColors.darkSurface 
        : AppColors.lightSurface;
  }
  
  List<Color> get authGradient {
    return _themeMode == ThemeMode.dark
        ? [AppColors.darkSurface, AppColors.darkCard]
        : AppColors.authGradient;
  }
}