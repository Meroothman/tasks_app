import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'compeleted_body.dart';
import 'home_body.dart';
import 'profile_page.dart';
import 'todo_body.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<int> currentIndexNotifier = ValueNotifier(0);
  final List<Widget> pages = [
    Homebody(),
    TodoBody(),
    CompeletedBody(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return pages[currentIndex];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return BottomNavigationBar(
            backgroundColor: themeProvider.surfaceColor,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 18),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sticky_note_2_outlined, size: 18),
                label: "TO DO",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task_outlined, size: 18),
                label: "Compeleted",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 20),
                label: "profile",
              ),
            ],
            currentIndex: currentIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: themeProvider.isDarkMode 
                ? AppColors.darkIcon 
                : AppColors.lightIcon,
            onTap: (index) {
              currentIndexNotifier.value = index;
            },
          );
        },
      ),
    );
  }
}