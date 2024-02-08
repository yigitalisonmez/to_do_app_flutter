import 'package:uuid/uuid.dart';

class Task {
  final String uuid = const Uuid().v1();
  final String taskDescription;
  DateTime time;
  bool taskState = false;

  Task({
    uuid,
    required this.taskDescription,
    required this.time,
    required this.taskState,
  });

  void changeTaskState() {
    taskState = !taskState;
  }

  Task jsonMapToObject(Map<String, dynamic> task) {
    return Task(
        uuid: task['uuid'],
        taskDescription: task['taskDescription'],
        time: DateTime.now(),
        taskState: task['taskState']);
  }
}
