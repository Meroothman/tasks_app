import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import '../../data/task_model.dart';
import 'task_tile.dart';

class HighPriorityList extends StatelessWidget {
  final List<TaskModel> tasks;

  const HighPriorityList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      height: 200,
      padding: const EdgeInsets.all(AppConstants.mediumPadding),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        border: Border.all(
          color: themeProvider.borderColor,
          width: AppConstants.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      ),
      child: ListView(
        children: [
          Text(
            AppConstants.highPriorityTasks,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => TaskTile(task: tasks[index]),
            ),
          ),
        ],
      ),
    );
  }
}
