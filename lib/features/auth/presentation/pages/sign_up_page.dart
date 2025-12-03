import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/core/cache/cache_consumer_impl.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/core/utils/functions.dart';
import 'package:to_do/core/widgets/custom_button.dart';
import 'package:to_do/core/widgets/custom_text_feild.dart';
import 'package:to_do/features/auth/presentation/widgets/custom_row_data.dart';
import 'package:to_do/features/tasks/presentation/pages/home_page.dart';
import '../../../../core/cache/cache_user_repository.dart';
import '../../data/user_model.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeProvider.isDarkMode
                ? [AppColors.darkCard, AppColors.darkSurface]
                : AppColors.authGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 50),
                Text(
                  AppConstants.signUpTitle,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.textColor,
                  ),
                ),
                Text(
                  AppConstants.getStarted,
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.textSecondaryColor,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomTextFelid(
                        hintText: AppConstants.firstName,
                        controller: firstNameController,
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(width: AppConstants.smallPadding),
                    Expanded(
                      child: CustomTextFelid(
                        hintText: AppConstants.lastName,
                        controller: lastNameController,
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.smallPadding),
                CustomTextFelid(
                  hintText: AppConstants.email,
                  controller: emailController,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: AppConstants.smallPadding),
                CustomTextFelid(
                  hintText: AppConstants.phoneNumber,
                  controller: phoneNumberController,
                  prefixIcon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: AppConstants.smallPadding),
                CustomTextFelid(
                  hintText: AppConstants.password,
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: AppConstants.smallPadding),
                CustomTextFelid(
                  hintText: AppConstants.confirmPassword,
                  controller: confirmPasswordController,
                  isPassword: true,
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 30),
                CustomButton(
                  data: AppConstants.signUp,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        showMassage(
                          context,
                          AppConstants.passwordMismatch,
                          backgroundColor: AppColors.red,
                        );
                      } else {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        CacheConsumerImpl cache = CacheConsumerImpl(
                          sharedPreferences: prefs,
                        );
                        CacheUserRepository repo = CacheUserRepository(cache);
                        final user = UserModel(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          phone: phoneNumberController.text,
                          password: passwordController.text,
                        );
                        await repo.saveUser(user);
                        repo.setLoggedIn(true);
                        pushReplaceNavigateTo(context, HomePage());
                      }
                    }
                  },
                ),
                SizedBox(height: 30),
                RowData(
                  text: AppConstants.haveAccount,
                  textButton: AppConstants.signIn,
                  screenName: LoginPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
