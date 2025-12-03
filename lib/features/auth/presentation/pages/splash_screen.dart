import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/core/cache/cache_consumer_impl.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/features/tasks/presentation/pages/home_page.dart';
import '../../../../core/cache/cache_user_repository.dart';
import 'login_page.dart';

class SplashOnBoardPage extends StatefulWidget {
  const SplashOnBoardPage({super.key});

  @override
  State<SplashOnBoardPage> createState() => _SplashOnBoardPageState();
}

class _SplashOnBoardPageState extends State<SplashOnBoardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _checkUser();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: AppConstants.fadeAnimationDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  Future<void> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CacheConsumerImpl cache = CacheConsumerImpl(sharedPreferences: prefs);
    CacheUserRepository repo = CacheUserRepository(cache);

    // Show onboard for 2 seconds then navigate
    await Future.delayed(AppConstants.splashDuration);

    if (repo.isLoggedIn()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeProvider.isDarkMode
                ? [AppColors.darkCard, AppColors.darkSurface]
                : AppColors.splashGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image Only
                  Image.asset(
                    "assets/images/pana.png",
                    height: 250,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.task_alt,
                        size: 100,
                        color: AppColors.primary,
                      );
                    },
                  ),
                  SizedBox(height: AppConstants.largePadding),
                  // Welcome Text Only
                  Column(
                    children: [
                      Text(
                        AppConstants.welcomeMessage,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppConstants.smallPadding),
                      Text(
                        AppConstants.productivityMessage,
                        style: TextStyle(
                          fontSize: 16,
                          color: themeProvider.textSecondaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
