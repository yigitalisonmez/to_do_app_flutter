part of '../todo_view.dart';

final TextEditingController _textEditingController = TextEditingController();

Widget _getTodoList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('todos')
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
      Provider.of<TodoViewModel>(context).todoNumber = snapshotSize;
      return ListView.builder(
        itemCount: Provider.of<TodoViewModel>(context).todoNumber,
        itemBuilder: (_, int index) {
          dynamic currentTask = snapshot.data!.docs[index].data();
          return TaskTile(
            isChecked: currentTask['todoState'],
            taskTitle: currentTask['todoDescription'],
            checkboxCallback: (status) {
              Provider.of<TodoViewModel>(context, listen: false)
                  .changeTaskStatus(
                uuid: currentTask['uuid'],
                currTaskState: currentTask['todoState'],
              );
            },
            deleteTaskCallback: () {
              Provider.of<TodoViewModel>(context, listen: false)
                  .deleteTask(uuid: currentTask['uuid']);
            },
            editTaskCallback: () {
              String newTaskDescription = currentTask['todoDescription'];
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
                                  Provider.of<TodoViewModel>(context,
                                          listen: false)
                                      .editTask(
                                          uuid: currentTask['uuid'],
                                          newTodoDescription:
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
