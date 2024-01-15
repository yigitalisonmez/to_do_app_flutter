import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkboxStateCallback(bool checkboxState) {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task!',
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        checkboxCallback: (checkboxState) {
          setState(() {
            isChecked = checkboxState;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final checkboxCallback;

  TaskCheckbox({required this.checkboxState, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: checkboxCallback,
    );
  }
}
