import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  late Box<Note> noteBox;

  NoteData() {
    _initNoteBox();
  }
  int boxLength = -1;

  ///BASIC CRUD OPERATIONS

  // Add note
  void addNote(Note newNote) {
    noteBox.add(newNote);
    notifyListeners();
  }

  // Get Note
  Note? getNote(dynamic key) {
    return noteBox.get(key);
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
  void updateNote(int index, Note updatedNote) {
    noteBox.putAt(index, updatedNote);
    notifyListeners();
  }

  void _initNoteBox() async {
    noteBox = await Hive.openBox('my_notes');
    boxLength = noteBox.length;
    notifyListeners();
  }
}
