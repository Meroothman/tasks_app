import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/features/auth/data/user_model.dart';
import 'package:to_do/features/auth/data/user_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    // إذا لم يتم تحميل البيانات بعد، نعرض واجهة مؤقتة
    if (userProvider.user == null) {
      return _buildLoadingHeader(themeProvider);
    }

    final user = userProvider.user!;
    final greeting = userProvider.getGreeting();

    return ListTile(
      leading: _buildProfileImage(user),
      title: Text(
        "$greeting, ${user.firstName}",
        style: TextStyle(fontSize: 16, color: themeProvider.textColor),
      ),
      subtitle: Text(
        AppConstants.greetingsSubtitle,
        style: TextStyle(fontSize: 14, color: themeProvider.textSecondaryColor),
      ),
      trailing: GestureDetector(
        onTap: () {
          themeProvider.toggleTheme(!themeProvider.isDarkMode);
        },
        child: CircleAvatar(
          backgroundColor: themeProvider.cardColor,
          child: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: themeProvider.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(UserModel user) {
    if (user.profileImagePath != null) {
      final imageFile = File(user.profileImagePath!);
      if (imageFile.existsSync()) {
        return CircleAvatar(backgroundImage: FileImage(imageFile));
      }
    }

    return const CircleAvatar(
      backgroundImage: NetworkImage(AppConstants.defaultAvatar),
    );
  }

  Widget _buildLoadingHeader(ThemeProvider themeProvider) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(AppConstants.defaultAvatar),
      ),
      title: Text(
        "Loading...",
        style: TextStyle(fontSize: 16, color: themeProvider.textColor),
      ),
      subtitle: Text(
        AppConstants.greetingsSubtitle,
        style: TextStyle(fontSize: 14, color: themeProvider.textSecondaryColor),
      ),
      trailing: CircleAvatar(
        backgroundColor: themeProvider.cardColor,
        child: Icon(
          themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          color: themeProvider.textColor,
        ),
      ),
    );
  }
}
