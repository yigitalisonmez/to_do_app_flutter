import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/helper/theme_constants.dart';
import 'package:todoey_flutter/helper/theme_provider.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(CupertinoIcons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
                builder: (context) => AddTaskScreen(), context: context);
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 60.0, left: 30.0, right: 30, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Provider.of<ThemeProvider>(context).isDark
                      ? kIconButtonBackgroundColorDark
                      : kIconButtonBackgroundColorLight,
                  radius: 30.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskNumber} Tasks',
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
