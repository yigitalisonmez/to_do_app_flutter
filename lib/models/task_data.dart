import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData extends ChangeNotifier {
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  CollectionReference collection =
      FirebaseFirestore.instance.collection('tasks');

  int taskNumber = 0;

  Future<int> getTaskNumber() async {
    return await stream!.length;
  }

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
  }

  void deleteTask({required String uuid}) {
    collection.doc(uuid).delete();
    taskNumber--;
    notifyListeners();
  }
}
