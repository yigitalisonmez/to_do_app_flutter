import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/todo/todo.dart';
import 'package:todoey_flutter/view_models/todo_view_model.dart';

class AddTodoView extends StatelessWidget {
  static String path = '/add-task-view';
  String? taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<ThemeProvider>(context).isDark
          ? const Color(0xff141415)
          : const Color(0xff676c70),
      child: Container(
        decoration: BoxDecoration(
            color: Provider.of<ThemeProvider>(context).isDark
                ? Colors.black
                : Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  taskTitle = value;
                },
              ),
              const SizedBox(height: 20.0),
              TextButton(
                  onPressed: () {
                    Provider.of<TodoViewModel>(context, listen: false).addTask(
                        Todo(
                            todoDescription: taskTitle!,
                            time: DateTime.now(),
                            todoState: false));

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
