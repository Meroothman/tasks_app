import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/core/cache/cache_consumer_impl.dart';
import 'package:to_do/core/theme/app_theme.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/features/auth/data/user_provider.dart';
import 'package:to_do/features/auth/presentation/pages/splash_screen.dart';
import 'package:to_do/features/tasks/data/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(AppConstants.tasksBox);

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final cache = CacheConsumerImpl(sharedPreferences: prefs);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(cache)),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // تهيئة UserProvider عند بداية التطبيق
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.init();
    });

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const SplashOnBoardPage(),
        );
      },
    );
  }
}
