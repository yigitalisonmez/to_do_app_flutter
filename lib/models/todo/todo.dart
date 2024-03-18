import 'package:uuid/uuid.dart';

class Todo {
  final String uuid = const Uuid().v1();
  final String todoDescription;
  DateTime time;
  bool todoState = false;

  Todo({
    uuid,
    required this.todoDescription,
    required this.time,
    required this.todoState,
  });

  void changeTodoState() {
    todoState = !todoState;
  }

  Todo jsonMapToObject(Map<String, dynamic> todo) {
    return Todo(
        uuid: todo['uuid'],
        todoDescription: todo['taskDescription'],
        time: DateTime.now(),
        todoState: todo['taskState']);
  }
}
