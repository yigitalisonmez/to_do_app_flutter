import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/screens/add_task_screen/add_task_screen.dart';

import 'package:todoey_flutter/screens/notes_screen/notes_screen.dart';
import 'package:todoey_flutter/screens/todo_screen/view_model/todo_screen_view_model.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../models/task/task_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
part 'package:todoey_flutter/screens/todo_screen/sub_view/custom_drawer.dart';
part 'package:todoey_flutter/screens/todo_screen/sub_view/navigation_bar.dart';

@RoutePage()
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //drawer: MyDrawer(homeScreenPath: homeScreenPath),
      bottomNavigationBar: _bottomNavigationBar(context),
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
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${DateFormat('EEE dd , MMM').format(DateTime.now())} ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DotGothic16'),
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: const TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
