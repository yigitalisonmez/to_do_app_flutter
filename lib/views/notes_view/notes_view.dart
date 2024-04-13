import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
import 'package:todoey_flutter/helpers/widgets/confirmation_dialog.dart';
import 'package:todoey_flutter/helpers/widgets/custom_note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/view_models/notes_view_model.dart';
import 'package:todoey_flutter/views/notes_view/note_content_view.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';
import '../../models/note/note.dart';

class NotesView extends StatelessWidget {
  NotesView({super.key});
  static String path = '/notes-view';
  String? noteTitle;

  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NotesViewModel>(context);
    if (noteData.boxLength == -1) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'NOTES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Provider.of<NotesViewModel>(context).noteBox.length == 0
              ? const Center(child: Text('Nothing here...'))
              : MasonryGridView.count(
                  itemCount:
                      Provider.of<NotesViewModel>(context).noteBox.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    ///NOTE CARD
                    return NoteCard(
                      content: Provider.of<NotesViewModel>(
                        context,
                      ).getNote(index)!.content,
                      color: cardColors[index % 3],
                      textColor: Colors.black,
                      height:
                          ((index % 4) == 3 || (index % 4) == 0) ? 180 : 240,
                      onTap: () {
                        Note note =
                            Provider.of<NotesViewModel>(context, listen: false)
                                .getNote(index)!;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => NoteContentView(
                                  currentNote: note, noteIndex: index)),
                        );
/*                        AutoRouter.of(context).push(
                          NoteContentRoute(
                            noteIndex: index,
                            currentNote: note,
                          ),
                        );*/
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (builder) => ConfirmationDialog(
                                  index: index,
                                ));
                      },
                      title: Provider.of<NotesViewModel>(context)
                          .noteBox
                          .getAt(index)!
                          .title,
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (builder) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Enter the title',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'DotGothic16',
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              autofocus: true,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                noteTitle = value;
                              },
                            ),
                            const SizedBox(height: 15),

                            /// ADD NEW NOTE
                            TextButton(
                              onPressed: () {
                                Note newNote = Note(
                                    title: noteTitle!,
                                    content: '',
                                    date: DateTime.now());

                                Provider.of<NotesViewModel>(context,
                                        listen: false)
                                    .addNote(newNote);
                                int boxSize = Provider.of<NotesViewModel>(
                                        context,
                                        listen: false)
                                    .noteBox
                                    .length;
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => NoteContentView(
                                          currentNote: newNote,
                                          noteIndex: boxSize - 1)),
                                );
/*                                AutoRouter.of(context).popAndPush(
                                    NoteContentRoute(
                                        noteIndex: boxSize - 1,
                                        currentNote: newNote));*/
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Submit',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
