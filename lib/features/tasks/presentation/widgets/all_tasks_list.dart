import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import '../../data/task_model.dart';
import 'task_tile.dart';

class AllTasksList extends StatelessWidget {
  final List<TaskModel> tasks;

  const AllTasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: tasks.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.smallPadding,
          vertical: 6,
        ),
        child: Container(
          height: AppConstants.listItemHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.smallPadding,
          ),
          decoration: BoxDecoration(
            color: themeProvider.cardColor,
            border: Border.all(
              color: themeProvider.borderColor,
              width: AppConstants.cardBorderWidth,
            ),
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          child: TaskTile(task: tasks[index]),
        ),
      ),
    );
  }
}
