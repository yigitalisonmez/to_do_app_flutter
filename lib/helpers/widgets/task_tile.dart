import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: []),
      child: ListTile(
        onLongPress: editTaskCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        leading: Checkbox(
          value: isChecked,
          onChanged: checkboxCallback,
          //checkboxCallback:
        ),
        trailing: IconButton(
          onPressed: deleteTaskCallback,
          icon: Icon(
            Icons.delete,
            color: Color(0xffd94d3c),
          ),
        ),
        //style: ListTileStyle(),
      ),
    );
  }
}