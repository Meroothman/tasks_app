import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';

class AchievedTasksCard extends StatelessWidget {
  final int doneTasks;
  final int totalTasks;
  final double percent;

  const AchievedTasksCard({
    super.key,
    required this.doneTasks,
    required this.totalTasks,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      color: themeProvider.cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: themeProvider.borderColor,
          width: AppConstants.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      ),
      child: ListTile(
        title: Text(
          AppConstants.achievedTasks,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: themeProvider.textColor,
          ),
        ),
        subtitle: Text(
          "$doneTasks out of $totalTasks Done",
          style: TextStyle(color: themeProvider.textSecondaryColor),
        ),
        trailing: CircularPercentIndicator(
          radius: 22,
          lineWidth: 4.0,
          percent: percent,
          center: Text(
            "${(percent * 100).toInt()}%",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: themeProvider.textColor,
            ),
          ),
          progressColor: AppColors.green,
          backgroundColor: themeProvider.isDarkMode
              ? AppColors.darkSurface
              : AppColors.lightSurface,
        ),
      ),
    );
  }
}
