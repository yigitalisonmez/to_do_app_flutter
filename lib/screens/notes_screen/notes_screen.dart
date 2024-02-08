import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  static String notesScreenPath = '/notes-screen';
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('NOTES SCREEN')),
    );
  }
}
