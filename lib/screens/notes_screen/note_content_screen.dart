import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/helper/theme_provider.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/models/note/note_data.dart';

class NoteContentScreen extends StatefulWidget {
  static String noteContentScreenPath = '/note-content-screen';
  final int noteIndex;

  const NoteContentScreen({super.key, required this.noteIndex});
  @override
  State<NoteContentScreen> createState() => _NoteContentScreenState();
}

class _NoteContentScreenState extends State<NoteContentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Provider.of<NoteData>(context).saveOnExit();
  }

  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    Note? note = Provider.of<NoteData>(context).getNote(widget.noteIndex);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        backgroundColor: Provider.of<ThemeProvider>(context).isDark
            ? Colors.black
            : Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
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
              Text('${note?.content}'),
            ],
          ),
        ));
  }
}
