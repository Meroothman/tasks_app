import 'package:flutter/material.dart';

class AppConstants {
  // Hive Boxes
  static const String tasksBox = "tasksBox";
  
  // Cache Keys
  static const String userKey = "user";
  static const String isLoggedInKey = "isLoggedIn";
  static const String themeModeKey = "themeMode";
  
  // Layout
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 16.0;
  static const double smallPadding = 8.0;
  static const double mediumPadding = 12.0;
  static const double largePadding = 20.0;
  
  // Button Constants
  static const double buttonHeight = 50.0;
  static const double buttonRadius = 50.0;
  static const double smallButtonRadius = 20.0;
  static const double buttonFontSize = 16.0;
  
  // Text Field Constants
  static const double textFieldRadius = 40.0;
  static const double smallTextFieldRadius = 20.0;
  static const EdgeInsetsGeometry textFieldPadding = 
      EdgeInsets.symmetric(horizontal: 16, vertical: 14);
  
  // Card Constants
  static const double cardBorderWidth = 1.0;
  static const double cardRadius = 15.0;
  static const double listItemHeight = 75.0;
  
  // Avatar Constants
  static const double avatarRadius = 20.0;
  static const String defaultAvatar = 
      "https://icons.veryicon.com/png/o/internet--web/web-interface-flat/6606-male-user.png";
  
  // Durations
  static const Duration fastDuration = Duration(milliseconds: 200);
  static const Duration normalDuration = Duration(milliseconds: 350);
  static const Duration splashDuration = Duration(seconds: 2);
  
  // Animation
  static const Duration fadeAnimationDuration = Duration(milliseconds: 1000);
  
  // Strings
  static const String appName = "Tasky";
  static const String greetingsSubtitle = "One task at a time. One step closer.";
  static const String welcomeMessage = "Welcome To Tasky 👋🏻";
  static const String productivityMessage = "Your productivity journey starts here.";
  static const String welcomeBack = "Welcome\nBack";
  static const String missedYou = "Hey we have missed you happy to see you again";
  static const String signUpTitle = "Sign Up";
  static const String getStarted = "Hello there! Let's get you started";
  static const String achievedTasks = "Achieved Tasks";
  static const String highPriorityTasks = "High Priority Tasks";
  static const String myTasks = "My Tasks";
  static const String addNewTask = "+ Add New task";
  static const String profile = "Profile";
  static const String profileInfo = "Profile Info";
  static const String settings = "Settings";
  static const String darkMode = "Dark Mode";
  static const String logout = "Logout";
  static const String firstName = "First name";
  static const String lastName = "Last name";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm Password";
  static const String phoneNumber = "Phone Number";
  static const String signIn = "Sign In";
  static const String signUp = "Sign Up";
  static const String noAccount = "Don't have an account ?";
  static const String haveAccount = "Already have an account ?";
  static const String todoTasks = "To Do Tasks";
  static const String completedTasks = "Completed Tasks";
  static const String noTodoTasks = "No To Do Tasks";
  static const String noCompletedTasks = "No Completed Tasks";
  
  // Error Messages
  static const String requiredField = "is required";
  static const String passwordMismatch = "Password and Confirm Password do not match";
  static const String invalidCredentials = "Invalid email or password";
  static const String taskNameRequired = "Task name is required";
  
  // Validation Messages
  static const String enterTaskName = "Enter your task name";
  static const String taskDescriptionHint = "Finish onboarding UI and hand off to devs by Thursday.";
}