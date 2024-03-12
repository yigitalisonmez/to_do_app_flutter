import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/models/note/note_data.dart';
import 'package:todoey_flutter/view_models/routines_view_model.dart';
import 'package:todoey_flutter/view_models/todo_view_model.dart';
import 'package:todoey_flutter/views/add_todo_view/add_todo_view.dart';
import 'package:todoey_flutter/views/notes_view/notes_view.dart';
import 'package:todoey_flutter/views/routines_view/routines_view.dart';
import 'package:todoey_flutter/views/splash_view/splash_view.dart';
import 'package:todoey_flutter/views/test_view.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';

import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  /// It's recommended to register all TypeAdapters before opening any boxes.
  Hive.registerAdapter(NoteAdapter());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteData(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoutinesViewModel(),
        )
      ],
      child: MaterialApp(
        //routerConfig: _appRouter.config(),
        initialRoute: TodoView.path,
        routes: {
          SplashView.path: (context) => const SplashView(),
          TodoView.path: (context) => const TodoView(),
          AddTodoView.path: (context) => AddTodoView(),
          NotesView.path: (context) => NotesView(),
          RoutinesView.path: (context) => const RoutinesView(),
          TestView.path: (context) => const TestView(),
        },
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).currTheme,
      ),
    );
  }
}
