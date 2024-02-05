import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final checkboxCallback;
  final deleteTaskCallback;
  final editTaskCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.deleteTaskCallback,
    required this.editTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: editTaskCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback, //TODO
        //checkboxCallback:
      ),
      trailing: IconButton(
        onPressed: deleteTaskCallback,
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      //style: ListTileStyle(),
    );
  }
}
