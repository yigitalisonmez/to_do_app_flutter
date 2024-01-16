import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'Go to gym'),
    Task(name: 'Buy new pair of shoes'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: tasks[index].isCompleted,
            taskTitle: tasks[index].name,
            checkboxCallback: (checkboxState) {
              setState(() {
                tasks[index].changeTaskState();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
