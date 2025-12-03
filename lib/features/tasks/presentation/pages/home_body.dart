import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/core/utils/functions.dart';
import 'package:to_do/core/widgets/custom_button.dart';
import 'package:to_do/features/tasks/data/task_model.dart';
import 'add_task_page.dart';
import '../widgets/achieved_tasks_card.dart';
import '../widgets/all_tasks_list.dart';
import '../widgets/high_priority_list.dart';
import '../widgets/home_header.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final tasksBox = Hive.box<TaskModel>(AppConstants.tasksBox);

    return ValueListenableBuilder(
      valueListenable: tasksBox.listenable(),
      builder: (context, box, _) {
        final allTasks = box.values.toList();
        final highPriorityTasks = allTasks
            .where((t) => t.isHighPriority)
            .toList();

        final doneTasks = allTasks.where((t) => t.isDone).length;
        final totalTasks = allTasks.length;
        final percent = (totalTasks == 0 ? 0 : doneTasks / totalTasks)
            .toDouble();
            
        return ListView(
          children: [
            const HomeHeader(),
            const SizedBox(height: AppConstants.smallPadding),
            AchievedTasksCard(
              doneTasks: doneTasks,
              totalTasks: totalTasks,
              percent: percent.toDouble(),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            HighPriorityList(tasks: highPriorityTasks),
            const SizedBox(height: AppConstants.smallPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Text(
                AppConstants.myTasks,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: themeProvider.textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.smallPadding),
              child: AllTasksList(tasks: allTasks),
            ),
            const SizedBox(height: AppConstants.largePadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                  data: AppConstants.addNewTask,
                  onPressed: () {
                    pushNavigateTo(context, const AddTaskPage());
                  },
                  width: null,
                  color: AppColors.primaryLight,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
          ],
        );
      },
    );
  }
}