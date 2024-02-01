import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String? taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  taskTitle = value;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false).addTask(Task(
                        taskDescription: taskTitle!,
                        time: DateTime.now(),
                        taskState: false));

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent, elevation: 10.0))
            ],
          ),
        ),
      ),
    );
  }
}
