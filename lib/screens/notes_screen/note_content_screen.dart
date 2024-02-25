import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/models/note/note_data.dart';

@RoutePage()
class NoteContentScreen extends StatefulWidget {
  static String noteContentScreenPath = '/note-content-screen';
  final int noteIndex;
  String noteContent;
  bool isNew;

  NoteContentScreen(
      {super.key,
      required this.noteIndex,
      required this.noteContent,
      required this.isNew});
  @override
  State<NoteContentScreen> createState() => _NoteContentScreenState();
}

class _NoteContentScreenState extends State<NoteContentScreen> {
  @override
  void initState() {
    super.initState();
    widget.isNew ? null : loadNote();
  }

  @override
  void dispose() {
    super.dispose();
    saveNote();
  }

  void loadNote() {
    final doc = Document()..insert(0, widget.noteContent);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  void saveNote() {
    String newNoteContent = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false)
        .saveNote(index: widget.noteIndex, noteContent: newNoteContent);
  }

  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    Note? note = Provider.of<NoteData>(context).getNote(widget.noteIndex);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  saveNote();
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
