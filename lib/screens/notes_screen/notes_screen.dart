import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/home_screen/home_screen.dart';
import 'package:todoey_flutter/widgets/custom_note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesScreen extends StatelessWidget {
  static String notesScreenPath = '/notes-screen';
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('NOTES')),
          ),
          drawer: MyDrawer(homeScreenPath: HomeScreen.homeScreenPath),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.count(
              itemCount: 8,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return NoteCard(
                  title: '$index ',
                  height: ((index % 4) == 3 || (index % 4) == 0) ? 150 : 200,
                  color: Colors.blue,
                );
              },
            ),
          )),
    );
  }
}
