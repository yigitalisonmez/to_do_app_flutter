import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/view_models/notes_view_model.dart';

class NoteContentView extends StatefulWidget {
  static String path = '/note-content-view';
  final Note currentNote;
  final int
      noteIndex; // ==-1 means a new note !=-1 means the real index of note

  NoteContentView(
      {super.key, required Note this.currentNote, required int this.noteIndex});
  @override
  State<NoteContentView> createState() => _NoteContentViewState();
}

class _NoteContentViewState extends State<NoteContentView> {
  @override
  void initState() {
    super.initState();
    if (widget.noteIndex != -1) {
      loadNoteToController();
    }
  }

  void loadNoteToController() {
    final doc = Document()..insert(0, widget.currentNote.content);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  void updateNoteContent() {
    String newNoteContent = _controller.document.toPlainText();
    widget.currentNote.content = newNoteContent;
  }

  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                updateNoteContent();
                Provider.of<NotesViewModel>(context, listen: false).saveNote(
                    newNote: widget.currentNote, index: widget.noteIndex);
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                onPressed: () {
                  updateNoteContent();
                  Provider.of<NotesViewModel>(context, listen: false).saveNote(
                      newNote: widget.currentNote, index: widget.noteIndex);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        backgroundColor: Provider.of<ThemeProvider>(context).isDark
            ? Colors.black
            : Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  showFontFamily: false,
                  showItalicButton: false,
                  showBoldButton: false,
                  showAlignmentButtons: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showCodeBlock: false,
                  showInlineCode: false,
                  showLeftAlignment: false,
                  showUnderLineButton: false,
                  showFontSize: false,
                  showQuote: false,
                  showLink: false,
                  showDividers: false,
                  showStrikeThrough: false,
                  showBackgroundColorButton: false,
                  showClearFormat: false,
                  showListCheck: false,
                  showIndent: false,
                  showListBullets: false,
                  controller: _controller,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
              Expanded(
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    showCursor: true,
                    controller: _controller,
                    readOnly: false,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('de'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
