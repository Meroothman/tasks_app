import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/features/tasks/data/task_model.dart';
import '../widgets/custom_list_view.dart';

class CompeletedBody extends StatelessWidget {
  const CompeletedBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final tasksBox = Hive.box<TaskModel>(AppConstants.tasksBox);
    
    return ValueListenableBuilder(
      valueListenable: tasksBox.listenable(),
      builder: (context, box, _) {
        final completedTasks = box.values.where((task) => task.isDone).toList();

        return completedTasks.isEmpty
            ? Center(
                child: Text(
                  AppConstants.noCompletedTasks,
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.textSecondaryColor,
                  ),
                ),
              )
            : CustomListView(
                tasks: completedTasks,
                title: AppConstants.completedTasks,
                icon: Icons.delete,
                onPressed: () {
                  for (var task in completedTasks) {
                    task.delete();
                  }
                },
              );
      },
    );
  }
}