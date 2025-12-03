import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/theme_provider.dart';
import 'package:to_do/core/utils/constants.dart';
import 'package:to_do/features/tasks/data/task_model.dart';
import '../widgets/custom_list_view.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final tasksBox = Hive.box<TaskModel>(AppConstants.tasksBox);

    return ValueListenableBuilder(
      valueListenable: tasksBox.listenable(),
      builder: (context, box, _) {
        final todoTasks = box.values.where((task) => !task.isDone).toList();

        return todoTasks.isEmpty
            ? Center(
                child: Text(
                  AppConstants.noTodoTasks,
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.textSecondaryColor,
                  ),
                ),
              )
            : CustomListView(tasks: todoTasks, title: AppConstants.todoTasks);
      },
    );
  }
}
