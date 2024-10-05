part of '../todo_view.dart';

_buildAddTodoBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Form(
          key: formKey,
          child: CustomModalBottomSheet(
            children: [
              const Text(
                'Add Todo',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),

              /// TEXT FIELD
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[a-z A-Z0-9]+$').hasMatch(value)) {
                    return 'Invalid todo name!';
                  }
                },
                controller: _textEditingController,
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _textEditingController.text = value;
                },
              ),
              const SizedBox(height: 20.0),
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // pop the context
                      Navigator.pop(context);
                      // add a task
                      Provider.of<DailyTasksViewModel>(context, listen: false)
                          .addTask(
                        newTask: Task(
                          title: _textEditingController.text,
                          isDone: false,
                          date: DateTime.now(),
                        ),
                        date: DateTimeEx.dateToString(DateTime.now()),
                      );

                      // clear text editing controller for next task
                      _textEditingController.text = '';
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ))
            ],
          ),
        );
      });
}
