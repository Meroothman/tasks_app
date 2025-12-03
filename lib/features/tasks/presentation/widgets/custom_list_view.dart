import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/app_text_styles.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';

class CustomListView extends StatelessWidget {
  final List tasks;
  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  const CustomListView({
    super.key,
    required this.tasks,
    required this.title,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, bottom: 20),
            child: Text(title, style: AppTextStyles.pageTitle(context)),
          ),
        ),
        ListView.builder(
          itemCount: tasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: 7,
              ),
              elevation: 0,
              color: themeProvider.cardColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: themeProvider.borderColor,
                  width: AppConstants.cardBorderWidth,
                ),
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
              ),
              child: ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (val) {
                    task.isDone = val!;
                    task.save();
                  },
                  checkColor: AppColors.white,
                  activeColor: AppColors.primary,
                  side: BorderSide(
                    color: themeProvider.borderColor,
                    width: AppConstants.cardBorderWidth,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                title: Text(
                  task.name,
                  style: TextStyle(
                    decoration: task.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 14,
                    color: task.isDone
                        ? themeProvider.textSecondaryColor
                        : themeProvider.textColor,
                  ),
                ),
                subtitle: Text(
                  task.description,
                  style: TextStyle(
                    decoration: task.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 14,
                    color: task.isDone
                        ? themeProvider.textSecondaryColor
                        : themeProvider.textSecondaryColor,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(icon , color: themeProvider.textSecondaryColor),
                  onPressed: () {
                    task.delete();
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
