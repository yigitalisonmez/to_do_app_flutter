import 'package:hive/hive.dart';
// dart run build_runner build
part 'daily_task.g.dart';

@HiveType(typeId: 6)
class DailyTask {
  @HiveField(0)
  String id;
  @HiveField(1)
  List<Task> tasks;

  @HiveField(2)
  DateTime date;

  DailyTask({required this.id, required this.tasks, required this.date});
}

@HiveType(typeId: 7)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  int reward;

  Task({
    required this.title,
    required this.isDone,
    required this.date,
    this.reward = 0,
  });
}
