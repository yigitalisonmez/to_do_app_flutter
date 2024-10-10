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
  QuerySnapshot<Object?>? documents;
  int todoNumber = 0;

  Future loadTasks() async {
    try {
      documents = await collection.orderBy('index').get();
      todoNumber = documents!.size;
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addTask(Todo todo) async {
    collection.doc(todo.uuid).set({
      'uuid': todo.uuid,
      'index': todo.index,
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

  void reorderTodos(int oldIndex, int newIndex) {
    // if tile did not move do nothing
    if (oldIndex == newIndex) return;
    QueryDocumentSnapshot? changingDocument;
    for (var doc in documents!.docs) {
      if (doc.get('index') == oldIndex) {
        changingDocument = doc;
        break;
      }
    }

    if (oldIndex < newIndex) {
      newIndex--;
      for (var i = oldIndex + 1; i <= newIndex; ++i) {
        updateIndex(
            uuid: documents!.docs[i].get('uuid'), index: i, changeAmount: -1);
      }
    } else {
      for (var i = newIndex; i < oldIndex; ++i) {
        updateIndex(
            uuid: documents!.docs[i].get('uuid'), index: i, changeAmount: 1);
      }
    }
    collection.doc(changingDocument!.get('uuid')).update({'index': newIndex});
    notifyListeners();
  }

  void updateIndex(
      {required String uuid, required index, required changeAmount}) {
    collection.doc(uuid).update({'index': (index + changeAmount)});
  }
}
