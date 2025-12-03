import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/core/widgets/custom_button.dart';
import 'package:to_do/core/widgets/custom_text_feild.dart';
import 'package:to_do/features/tasks/data/task_model.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isHighPriority = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.surfaceColor,
      appBar: AppBar(
        title: const Text('New Task'),
        backgroundColor: themeProvider.surfaceColor,
        foregroundColor: themeProvider.textColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: themeProvider.textColor,
              ),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            CustomTextFelid(
              hintText: AppConstants.enterTaskName,
              controller: taskNameController,
              radius: AppConstants.smallTextFieldRadius,
              borderSide: BorderSide(color: themeProvider.borderColor),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.largePadding,
                vertical: AppConstants.largePadding,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: themeProvider.textColor,
              ),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            CustomTextFelid(
              hintText: AppConstants.taskDescriptionHint,
              controller: descriptionController,
              radius: AppConstants.smallTextFieldRadius,
              borderSide: BorderSide(color: themeProvider.borderColor),
              minLines: 4,
              maxLines: 6,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.largePadding,
                vertical: AppConstants.largePadding,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "High Priority",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: themeProvider.textColor,
                  ),
                ),
                const Spacer(),
                Switch(
                  value: isHighPriority,
                  onChanged: (value) {
                    setState(() {
                      isHighPriority = value;
                    });
                  },
                  activeThumbColor: AppColors.primaryLight,
                ),
              ],
            ),
            SizedBox(height: 100),
            CustomButton(
              data: "Add task",
              onPressed: () {
                final name = taskNameController.text.trim();
                final desc = descriptionController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppConstants.taskNameRequired),
                      backgroundColor: AppColors.red,
                    ),
                  );
                  return;
                }
                var task = TaskModel(
                  name: name,
                  description: desc,
                  isHighPriority: isHighPriority,
                );
                final box = Hive.box<TaskModel>(AppConstants.tasksBox);
                box.add(task);
                Navigator.pop(context);
              },
              width: double.infinity,
              color: AppColors.primaryLight,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
