import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("tasks").snapshots(),
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
          itemCount: snapshotSize,
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
            );
          },
        );
      },
    );
  }
}
