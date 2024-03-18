import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/view_models/notes_view_model.dart';

class ConfirmationDialog extends StatelessWidget {
  ConfirmationDialog({super.key, required this.index});
  final int index;
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
            const Text('Do you want to delete this file?'),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<NotesViewModel>(context, listen: false)
                        .deleteNoteAt(index);
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
