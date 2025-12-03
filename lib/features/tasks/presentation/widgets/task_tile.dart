import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import '../../data/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Checkbox(
          value: task.isDone,
          onChanged: (val) {
            task.isDone = val!;
            task.save();
          },
          checkColor: AppColors.white,
          activeColor: AppColors.primary,
          fillColor: WidgetStateProperty.all(
            task.isDone ? AppColors.primary : themeProvider.borderColor,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                task.name,
                style: TextStyle(
                  decoration: task.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: task.isDone
                      ? themeProvider.textSecondaryColor
                      : themeProvider.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                task.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: task.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: task.isDone
                      ? themeProvider.textSecondaryColor
                      : themeProvider.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
