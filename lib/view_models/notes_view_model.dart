import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/note/note.dart';

import '../helpers/console_color.dart';

class NotesViewModel extends ChangeNotifier {
  late Box<Note> noteBox;
  static late Box<Note> _noteBox;

  int selectedIndex = -1;

  NotesViewModel() {
    noteBox = _noteBox;
  }

  static Future<void> initNoteBox() async {
    ConsoleColor.printInColor(
        "Starting to initialize noteBox...", ConsoleColor.red);
    _noteBox = await Hive.openBox('my_notes');
    ConsoleColor.printInColor("Done!", ConsoleColor.red);
  }

  ///BASIC CRUD OPERATIONS

  // Add note
  void addNote(Note newNote) {
    noteBox.add(newNote);

    notifyListeners();
  }

  // Get Note
  Note? getNote(int index) {
    return noteBox.getAt(index);
  }

  // Get notes
  /// Returns iterable note's.Not a list
  dynamic getNotes(dynamic key) {
    return noteBox.values;
  }

  // Delete note
  void deleteNoteAt(int index) {
    noteBox.deleteAt(index);
    notifyListeners();
  }

  // Update note
  void saveNote({required Note newNote, required int index}) {
    Note note = getNote(index)!;
    note.content = newNote.content;
    noteBox.putAt(index, note);
    notifyListeners();
  }
}
