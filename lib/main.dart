import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/models/note/note_data.dart';
import 'package:todoey_flutter/models/task/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen/add_task_screen.dart';

import 'package:todoey_flutter/screens/notes_screen/notes_screen.dart';
import 'package:todoey_flutter/screens/splash_screen/splash_screen.dart';

import 'firebase_options.dart';
import 'screens/home_screen/home_screen.dart';
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
          create: (context) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.splashScreenPath,
        routes: {
          HomeScreen.homeScreenPath: (context) => const HomeScreen(),
          SplashScreen.splashScreenPath: (context) => const SplashScreen(),
          AddTaskScreen.addTaskScreenPath: (context) => AddTaskScreen(),
          NotesScreen.notesScreenPath: (context) => NotesScreen(),
        },
        theme: Provider.of<ThemeProvider>(context).currTheme,
      ),
    );
  }
}
