import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/helpers/widgets/custom_modal_bottom_sheet.dart';
import 'package:todoey_flutter/helpers/widgets/shadowed_button.dart';
import 'package:todoey_flutter/helpers/widgets/task_tile.dart';
import 'package:todoey_flutter/models/daily_task/daily_task.dart';
import 'package:todoey_flutter/view_models/daily_tasks_view_model.dart';
import 'package:todoey_flutter/views/notes_view/notes_view.dart';
import 'package:todoey_flutter/views/routines_view/routines_view.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
part 'package:todoey_flutter/views/todo_view/sub_view/custom_drawer.dart';
part 'package:todoey_flutter/views/todo_view/sub_view/navigation_bar.dart';
part 'package:todoey_flutter/views/todo_view/sub_view/todo_list.dart';
part 'package:todoey_flutter/views/todo_view/sub_view/add_todo_bottom_sheet.dart';

final TextEditingController _textEditingController = TextEditingController();
final formKey = GlobalKey<FormState>();

class TodoView extends StatefulWidget {
  static String path = '/todo-view';

  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    dynamic dailyTaskBoxValues =
        Provider.of<DailyTasksViewModel>(context).dailyTaskBox.values;
    String todayAsStr = DateTimeEx.dateToString(DateTime.now());
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: ShadowedButton(
        iconData: Icons.add,
        onPressed: () => _buildAddTodoBottomSheet(context),
      ),
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
                      fontWeight: FontWeight.w300,
                    ),
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
                  '${dailyTaskBoxValues.isEmpty ? 0 : dailyTaskBoxValues.last.tasks.length} Tasks',
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
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/illustration/todo_ill.png'),
                  ),
                  getTodoList(
                      context,
                      Provider.of<DailyTasksViewModel>(context, listen: false)
                          .getDailyTask(todayAsStr)!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
