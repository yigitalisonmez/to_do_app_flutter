import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Go to gym'),
    Task(name: 'Buy new pair of shoes'),
  ];

  int get taskNumber {
    return _tasks.length;
  }

  List<Task> getTasksList() {
    return _tasks;
  }

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }
}
