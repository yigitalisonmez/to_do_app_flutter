import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task/task_data.dart';

final TextEditingController _textEditingController = TextEditingController();

class TaskList extends StatelessWidget {
  const TaskList({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('tasks')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (BuildContext ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No Task for now'),
          );
        }
        int snapshotSize = snapshot.data!.size;
        Provider.of<TaskData>(context).taskNumber = snapshotSize;
        return ListView.builder(
          itemCount: Provider.of<TaskData>(context).taskNumber,
          itemBuilder: (_, int index) {
            dynamic currentTask = snapshot.data!.docs[index].data();
            return TaskTile(
              isChecked: currentTask['taskState'],
              taskTitle: currentTask['taskDescription'],
              checkboxCallback: (status) {
                Provider.of<TaskData>(context, listen: false).changeTaskStatus(
                  uuid: currentTask['uuid'],
                  currTaskState: currentTask['taskState'],
                );
              },
              deleteTaskCallback: () {
                Provider.of<TaskData>(context, listen: false)
                    .deleteTask(uuid: currentTask['uuid']);
              },
              editTaskCallback: () {
                String newTaskDescription = currentTask['taskDescription'];
                _textEditingController.text = newTaskDescription;
                showDialog(
                    context: context,
                    builder: (builder) => Dialog(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Enter new task description'),
                                const SizedBox(height: 15),
                                TextField(
                                  controller: _textEditingController,
                                  cursorColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  autofocus: true,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    newTaskDescription = value;
                                  },
                                ),
                                TextButton(
                                  onPressed: () {
                                    Provider.of<TaskData>(context,
                                            listen: false)
                                        .editTask(
                                            uuid: currentTask['uuid'],
                                            newTaskDescription:
                                                newTaskDescription!);

                                    Navigator.pop(context);
                                  },
                                  child: const Text('Submit'),
                                ),
                              ],
                            ),
                          ),
                        ));
              },
            );
          },
        );
      },
    );
  }
}
