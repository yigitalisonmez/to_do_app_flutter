import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/helpers/widgets/tasks_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:todoey_flutter/view_models/todo_view_model.dart';
import 'package:todoey_flutter/views/add_todo_view/add_todo_view.dart';
import 'package:todoey_flutter/views/notes_view/notes_view.dart';
import 'package:todoey_flutter/views/routines_view/routines_view.dart';
import '../../models/task/task_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
part 'package:todoey_flutter/views/todo_view/sub_view/custom_drawer.dart';
part 'package:todoey_flutter/views/todo_view/sub_view/navigation_bar.dart';

class TodoView extends StatefulWidget {
  static String path = '/todo-view';
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      //bottomNavigationBar: animatedNavigationBar(context),
      floatingActionButton: FloatingActionButton(
          child: const Icon(CupertinoIcons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
                builder: (context) => AddTodoView(), context: context);
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
                  '${Provider.of<TaskData>(context, listen: true).taskNumber} Tasks',
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
