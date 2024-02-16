import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/note/note_data.dart';
import 'package:todoey_flutter/screens/home_screen/home_screen.dart';
import 'package:todoey_flutter/screens/notes_screen/note_content_screen.dart';
import 'package:todoey_flutter/widgets/confirmation_dialog.dart';
import 'package:todoey_flutter/widgets/custom_note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../models/note/note.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});
  static String notesScreenPath = '/notes-screen';
  String? noteTitle;

  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteData>(context);

    if (noteData.boxLength == -1) {
      return Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('NOTES'),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        drawer: MyDrawer(homeScreenPath: HomeScreen.homeScreenPath),
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
                      height:
                          ((index % 4) == 3 || (index % 4) == 0) ? 120 : 200,
                      color: Colors.blue,
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
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
                            const Text('Enter note title'),
                            const SizedBox(height: 15),
                            TextField(
                              autofocus: true,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                noteTitle = value;
                              },
                            ),
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
                              child: const Text('Submit'),
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
