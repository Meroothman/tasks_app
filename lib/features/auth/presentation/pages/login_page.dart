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
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                SizedBox(height: 100),
                Text(
                  AppConstants.welcomeBack,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.textColor,
                  ),
                ),
                Text(
                  AppConstants.missedYou,
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.textSecondaryColor,
                  ),
                ),
                SizedBox(height: 50),
                CustomTextFelid(
                  hintText: AppConstants.email,
                  controller: emailController,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                CustomTextFelid(
                  hintText: AppConstants.password,
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 30),
                CustomButton(
                  data: AppConstants.signIn,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      CacheConsumerImpl cache = CacheConsumerImpl(
                        sharedPreferences: prefs,
                      );
                      CacheUserRepository repo = CacheUserRepository(cache);
                      UserModel? savedUser = repo.getUser();
                      if (emailController.text == savedUser?.email &&
                          passwordController.text == savedUser?.password) {
                        pushReplaceNavigateTo(context, HomePage());
                        repo.setLoggedIn(true);
                      } else {
                        showMassage(
                          context,
                          AppConstants.invalidCredentials,
                          backgroundColor: AppColors.red,
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 30),
                RowData(
                  text: AppConstants.noAccount,
                  textButton: AppConstants.signUp,
                  screenName: SignUpPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
