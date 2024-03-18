import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/todo/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoViewModel extends ChangeNotifier {
  TodoViewModel() {
    loadTasks();
  }

  bool isLoading = true;

  final Stream<QuerySnapshot<Map<String, dynamic>>>? stream =
      FirebaseFirestore.instance.collection('todos').snapshots();

  static CollectionReference collection =
      FirebaseFirestore.instance.collection('todos');

  List<Todo> todoList = [];

  int todoNumber = 0;

  Future loadTasks() async {
    try {
      QuerySnapshot<Object?> documents = await collection.get();
      todoNumber = documents.size;
      await Future.delayed(Duration(milliseconds: 300));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addTask(Todo todo) async {
    collection.doc(todo.uuid).set({
      'uuid': todo.uuid,
      'todoDescription': todo.todoDescription,
      'todoState': todo.todoState,
      'time': todo.time
    });
    todoNumber++;
    notifyListeners();
  }

  void changeTaskStatus({
    required String uuid,
    required bool currTaskState,
  }) async {
    collection.doc(uuid).update({'todoState': !currTaskState});
    notifyListeners();
  }

  void deleteTask({required String uuid}) {
    collection.doc(uuid).delete();
    todoNumber--;
    notifyListeners();
  }

  void editTask({
    required String uuid,
    required String newTodoDescription,
  }) {
    collection.doc(uuid).update({'todoDescription': newTodoDescription});
    notifyListeners();
  }

  void setTaskNumber({required int snapshotSize}) {
    todoNumber = snapshotSize;
    notifyListeners();
  }
}
