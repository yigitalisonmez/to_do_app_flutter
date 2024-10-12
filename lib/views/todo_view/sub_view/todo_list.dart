part of '../todo_view.dart';

/*void _buildEditTaskView(BuildContext context, Task currentTask) {
  String newTaskDescription = currentTask['todoDescription'];
  _textEditingController.text = newTaskDescription;
  showDialog(
      context: context,
      builder: (builder) => Dialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    cursorColor: Theme.of(context).scaffoldBackgroundColor,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      newTaskDescription = value;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<TodoViewModel>(context, listen: false)
                          .editTask(
                        uuid: currentTask['uuid'],
                        newTodoDescription: newTaskDescription,
                      );

                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ));
}*/

Widget _buildTodoShimmer() {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: 8,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        period: const Duration(milliseconds: 1200),
        baseColor: kShimmerBaseColor,
        highlightColor: kShimmerHighlightColor,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      height: 40,
                      width: 200,
                    ))),
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 20, 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  height: 40,
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget getTodoList(BuildContext context, DailyTask dailyTask) {
  String dateToday = DateTimeEx.dateToString(DateTime.now());
  return Provider.of<DailyTasksViewModel>(context)
          .dailyTaskBox
          .values
          .last
          .tasks
          .isEmpty
      ? const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nothing to see here...',
            ),
          ],
        )
      : ListView.builder(
          itemCount: Provider.of<DailyTasksViewModel>(context)
              .dailyTaskBox
              .values
              .last
              .tasks
              .length,
          itemBuilder: (_, int index) {
            Task currentTask = dailyTask.tasks[index];
            return TaskTile(
              key: ValueKey(index),
              isChecked: currentTask.isDone,
              taskTitle: currentTask.title,
              checkboxCallback: (status) {
                Provider.of<DailyTasksViewModel>(context, listen: false)
                    .updateTaskStatus(key: dailyTask.id, taskIdx: index);
              },
              deleteTaskCallback: () {
                Provider.of<DailyTasksViewModel>(context, listen: false)
                    .deleteTask(date: dateToday, index: index);
              },
              editTaskCallback: () {
                String newTaskTitle = currentTask.title;
                _textEditingController.text = newTaskTitle;
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
                                    newTaskTitle = value;
                                  },
                                ),
                                TextButton(
                                  onPressed: () {
                                    /// TODO updated task reward will be asked to user to enter.
                                    Provider.of<DailyTasksViewModel>(context,
                                            listen: false)
                                        .updateTask(
                                            updatedTaskTitle: newTaskTitle,
                                            updatedTaskReward: 50,
                                            key: dailyTask.id,
                                            taskIdx: index);

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
}
