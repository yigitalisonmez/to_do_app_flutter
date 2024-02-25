import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
import 'package:todoey_flutter/models/note/note_data.dart';
import 'package:todoey_flutter/screens/todo_screen/todo_screen.dart';
import 'package:todoey_flutter/screens/notes_screen/note_content_screen.dart';
import 'package:todoey_flutter/widgets/confirmation_dialog.dart';
import 'package:todoey_flutter/widgets/custom_note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../models/note/note.dart';

@RoutePage()
class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});
  static String notesScreenPath = '/notes-screen';
  String? noteTitle;

  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteData>(context);

    if (noteData.boxLength == -1) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('NOTES'),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        //drawer: MyDrawer(homeScreenPath: HomeScreen.homeScreenPath),
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Provider.of<NoteData>(context).noteBox.length == 0
              ? const Center(child: Text('Nothing here...'))
              : MasonryGridView.count(
                  itemCount: Provider.of<NoteData>(context).noteBox.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    ///NOTE CARD
                    return NoteCard(
                      content: Provider.of<NoteData>(context, listen: false)
                          .getNote(index)!
                          .content,
                      color: cardColors[index % 3],
                      textColor: Colors.black,
                      height:
                          ((index % 4) == 3 || (index % 4) == 0) ? 180 : 240,
                      onTap: () {
                        String noteContent =
                            Provider.of<NoteData>(context, listen: false)
                                .getNote(index)!
                                .content;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoteContentScreen(
                                      noteIndex: index,
                                      noteContent: noteContent,
                                      isNew: false,
                                    )));
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (builder) => ConfirmationDialog(
                                  index: index,
                                ));
                      },
                      title: Provider.of<NoteData>(context)
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
                            TextButton(
                              onPressed: () {
                                Provider.of<NoteData>(context, listen: false)
                                    .addNote(Note(
                                        title: noteTitle!,
                                        content: '',
                                        date: DateTime.now()));
                                int size = Provider.of<NoteData>(context,
                                        listen: false)
                                    .boxLength;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NoteContentScreen(
                                            noteIndex: size,
                                            noteContent: '',
                                            isNew: true)));
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
