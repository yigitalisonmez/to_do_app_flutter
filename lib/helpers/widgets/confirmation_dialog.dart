import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/view_models/notes_view_model.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {super.key, required this.callbackFunction, required this.title});

  final String title;
  final Function() callbackFunction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
/*                    Provider.of<NotesViewModel>(context, listen: false)
                        .deleteNoteAt(index);*/
                    callbackFunction.call();
                  },
                  child: const Text('YES'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
