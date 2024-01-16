import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              isChecked: taskData.getTasksList()[index].isCompleted,
              taskTitle: taskData.getTasksList()[index].name,
              checkboxCallback: (checkboxState) {
                /*              setState(() {
                  widget.tasks[index].changeTaskState();
                });*/
              });
        },
        itemCount: taskData.taskNumber,
      );
    });
  }
}
