part of '../todo_view.dart';

_buildAddTodoBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Provider.of<ThemeProvider>(context).isDark
              ? const Color(0xff141415)
              : const Color(0xff676c70),
          child: Container(
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).isDark
                    ? Colors.black
                    : Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Add Todo',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0),
                  ),

                  /// TEXT FIELD
                  TextField(
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
                        Provider.of<TodoViewModel>(context, listen: false)
                            .addTask(
                          Todo(
                            todoDescription: _textEditingController.text,
                            time: DateTime.now(),
                            todoState: false,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      });
}
