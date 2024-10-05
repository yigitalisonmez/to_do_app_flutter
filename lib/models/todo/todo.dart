import 'package:uuid/uuid.dart';

class Todo {
  final String uuid = const Uuid().v1();
  final String todoDescription;
  final int index;
  DateTime time;
  bool todoState = false;

  Todo({
    uuid,
    required this.todoDescription,
    required this.index,
    required this.time,
    required this.todoState,
  });

  void changeTodoState() {
    todoState = !todoState;
  }

  Todo jsonMapToObject(Map<String, dynamic> todo) {
    return Todo(
      uuid: todo['uuid'],
      index: todo['index'],
      todoDescription: todo['todoDescription'],
      time: DateTime.now(),
      todoState: todo['todoState'],
    );
  }
}
