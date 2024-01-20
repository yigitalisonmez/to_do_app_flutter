import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class TaskData extends ChangeNotifier {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  List<Task> _tasks = [
    Task(name: 'Go to gym'),
    Task(name: 'Buy new pair of shoes'),
  ];

  int get taskNumber {
    return _tasks.length;
  }

  List<Task> getTasksList() {
    _database.collection('tasks').snapshots();
    return _tasks;
  }

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void changeTaskStatus(int index) {
    _tasks[index].changeTaskState();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
