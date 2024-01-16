import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  String? taskName;
  final void Function(String) addButtonCallback;

  AddTaskScreen({required this.addButtonCallback});

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
                  taskName = value;
                  print('taskName:$taskName');
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                  //TODO on pressed
                  onPressed: () {
                    addButtonCallback(taskName!);
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
