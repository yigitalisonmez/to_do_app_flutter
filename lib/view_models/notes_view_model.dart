import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/note/note.dart';

class NotesViewModel extends ChangeNotifier {
  late Box<Note> noteBox;

  NotesViewModel() {
    _initNoteBox();
  }

  int boxLength = -1;
  int selectedIndex = -1;

  ///BASIC CRUD OPERATIONS

  // Add note
  void addNote(Note newNote) {
    noteBox.add(newNote);
    boxLength++;
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
    boxLength--;
    notifyListeners();
  }

  // Update note
  void saveNote({required Note newNote, required int index}) {
    Note note = getNote(index)!;
    note.content = newNote.content;
    noteBox.putAt(index, note);
    notifyListeners();
  }

  void _initNoteBox() async {
    noteBox = await Hive.openBox('my_notes');
    boxLength = noteBox.length;
    notifyListeners();
  }
}
