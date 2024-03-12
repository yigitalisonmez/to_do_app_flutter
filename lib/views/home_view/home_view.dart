import 'package:flutter/material.dart';
import 'package:todoey_flutter/views/notes_view/notes_view.dart';
import 'package:todoey_flutter/views/routines_view/routines_view.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  static String path = '/home-view';
  int _selectedIndex = 1;
  List<Widget> screens = [
    const TodoView(),
    NotesView(),
    const RoutinesView(),
  ];

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[widget._selectedIndex],
    );
  }
}
