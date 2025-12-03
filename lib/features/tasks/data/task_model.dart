import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool isHighPriority;

  @HiveField(3)
  bool isDone;

  TaskModel({
    required this.name,
    required this.description,
    required this.isHighPriority,
    this.isDone = false,
  });
}
