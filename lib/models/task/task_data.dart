import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoey_flutter/screens/home_screen/home_screen.dart';

class TaskData extends ChangeNotifier {
  final Stream<QuerySnapshot<Map<String, dynamic>>>? stream =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  static CollectionReference collection =
      FirebaseFirestore.instance.collection('tasks');

  List<Task> taskList = [];

  int taskNumber = 0;

  bool isLoading = true;

  loadTasks(BuildContext ctx) async {
    isLoading = true;
    QuerySnapshot<Object?> documents = await collection.get();
    isLoading = false;
    taskNumber = documents.size;
    Navigator.popAndPushNamed(ctx, HomeScreen.homeScreenPath);
    notifyListeners();
    return null;
  }

  void getTask({required String uuid}) async {}
  void addTask(Task task) async {
    collection.doc(task.uuid).set({
      'uuid': task.uuid,
      'taskDescription': task.taskDescription,
      'taskState': task.taskState,
      'time': task.time
    });
    taskNumber++;
    notifyListeners();
  }

  void changeTaskStatus({
    required String uuid,
    required bool currTaskState,
  }) async {
    collection.doc(uuid).update({'taskState': !currTaskState});
    notifyListeners();
  }

  void deleteTask({required String uuid}) {
    collection.doc(uuid).delete();
    taskNumber--;
    notifyListeners();
  }

  void editTask({
    required String uuid,
    required String newTaskDescription,
  }) {
    collection.doc(uuid).update({'taskDescription': newTaskDescription});
    notifyListeners();
  }

  void setTaskNumber({required int snapshotSize}) {
    taskNumber = snapshotSize;
    notifyListeners();
  }
}
