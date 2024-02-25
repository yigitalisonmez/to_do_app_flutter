import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/routes/app_router.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/models/note/note_data.dart';
import 'package:todoey_flutter/models/task/task_data.dart';
import 'package:todoey_flutter/screens/todo_screen/view_model/todo_screen_view_model.dart';

import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _appRouter = AppRouter();

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
        ),
        ChangeNotifierProvider(
          create: (context) => TodoScreenViewModel(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).currTheme,
      ),
    );
  }
}
