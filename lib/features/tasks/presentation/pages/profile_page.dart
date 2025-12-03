import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/core/cache/cache_consumer_impl.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/core/utils/functions.dart';
import 'package:to_do/core/utils/image_service.dart';
import 'package:to_do/features/auth/presentation/pages/login_page.dart';
import 'package:to_do/features/tasks/presentation/widgets/info_tile.dart';
import '../../../../core/cache/cache_user_repository.dart';
import '../../../auth/data/user_model.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ValueNotifier<UserModel?> _userNotifier = ValueNotifier<UserModel?>(
    null,
  );
  final ValueNotifier<File?> _profileImageNotifier = ValueNotifier<File?>(null);
  late CacheUserRepository _repo;

  Future<void> _initUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CacheConsumerImpl cache = CacheConsumerImpl(sharedPreferences: prefs);
    _repo = CacheUserRepository(cache);

    final user = _repo.getUser();
    _userNotifier.value = user;

    // جلب الصورة المحفوظة
    if (user?.profileImagePath != null) {
      final imageFile = File(user!.profileImagePath!);
      if (await imageFile.exists()) {
        _profileImageNotifier.value = imageFile;
      }
    }
  }

  Future<void> _updateUser(UserModel updatedUser) async {
    await _repo.saveUser(updatedUser);
    _userNotifier.value = updatedUser;
  }

  Future<void> _pickAndSaveImage() async {
    final File? pickedImage = await ImageService.pickImageFromGallery();

    if (pickedImage != null) {
      // حفظ الصورة محلياً
      final savedImage = await ImageService.saveImageLocally(pickedImage);

      // تحديث قيمة الصورة
      _profileImageNotifier.value = savedImage;

      // تحديث بيانات المستخدم
      final currentUser = _userNotifier.value;
      if (currentUser != null) {
        final updatedUser = currentUser.copyWith(
          profileImagePath: savedImage.path,
        );
        _updateUser(updatedUser);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // تهيئة البيانات عند أول مرة يتم فيها بناء الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_userNotifier.value == null) {
        _initUser(context);
      }
    });

    return ValueListenableBuilder<UserModel?>(
      valueListenable: _userNotifier,
      builder: (context, user, child) {
        if (user == null) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        return ValueListenableBuilder<File?>(
          valueListenable: _profileImageNotifier,
          builder: (context, profileImage, child) {
            return Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.lightSurface,
                          backgroundImage: profileImage != null
                              ? FileImage(profileImage) as ImageProvider
                              : NetworkImage(AppConstants.defaultAvatar),
                          child:
                              profileImage == null &&
                                  user.profileImagePath == null
                              ? const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: AppColors.lightTextSecondary,
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickAndSaveImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: themeProvider.cardColor,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      "${user.firstName} ${user.lastName}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.textColor,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 14,
                        color: themeProvider.textSecondaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Profile Info Title
                  Text(
                    AppConstants.profileInfo,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: themeProvider.textColor,
                    ),
                  ),

                  const SizedBox(height: AppConstants.largePadding),

                  /// ✅ First Name
                  ProfileInfoRow(
                    icon: Icons.person,
                    label: AppConstants.firstName,
                    value: user.firstName,
                    onEdit: (newVal) {
                      final updatedUser = user.copyWith(firstName: newVal);
                      _updateUser(updatedUser);
                    },
                  ),

                  /// ✅ Last Name
                  ProfileInfoRow(
                    icon: Icons.person,
                    label: AppConstants.lastName,
                    value: user.lastName,
                    onEdit: (newVal) {
                      final updatedUser = user.copyWith(lastName: newVal);
                      _updateUser(updatedUser);
                    },
                  ),

                  /// ✅ Email
                  ProfileInfoRow(
                    icon: Icons.email,
                    label: AppConstants.email,
                    value: user.email,
                    onEdit: (newVal) {
                      final updatedUser = user.copyWith(email: newVal);
                      _updateUser(updatedUser);
                    },
                  ),

                  const SizedBox(height: 30),

                  /// Settings Title
                  Text(
                    AppConstants.settings,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: themeProvider.textColor,
                    ),
                  ),

                  const SizedBox(height: AppConstants.largePadding),

                  /// Dark Mode Row
                  Row(
                    children: [
                      Icon(
                        Icons.dark_mode,
                        size: 28,
                        color: themeProvider.textColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppConstants.darkMode,
                        style: TextStyle(
                          fontSize: 20,
                          color: themeProvider.textColor,
                        ),
                      ),
                      const Spacer(),
                      Switch(
                        value: themeProvider.isDarkMode,
                        activeThumbColor: AppColors.primary,
                        inactiveThumbColor: AppColors.grey,
                        onChanged: (val) {
                          themeProvider.toggleTheme(val);
                        },
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: themeProvider.borderColor,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 28,
                        color: themeProvider.textColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppConstants.logout,
                        style: TextStyle(
                          fontSize: 20,
                          color: themeProvider.textColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          _repo.setLoggedIn(false);
                          pushReplaceNavigateTo(context, LoginPage());
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 28,
                          color: themeProvider.textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
