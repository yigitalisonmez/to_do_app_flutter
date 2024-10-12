import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/console_color.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:todoey_flutter/models/daily_task/daily_task.dart';
import 'package:todoey_flutter/models/note/note.dart';
import 'package:todoey_flutter/models/routine/routine.dart';
import 'package:todoey_flutter/models/routine/routine_item.dart';
import 'package:todoey_flutter/view_models/daily_tasks_view_model.dart';
import 'package:todoey_flutter/view_models/home_view_model.dart';
import 'package:todoey_flutter/view_models/notes_view_model.dart';
import 'package:todoey_flutter/view_models/routines_view_model.dart';
import 'package:todoey_flutter/view_models/todo_view_model.dart';
import 'package:todoey_flutter/views/home_view/home_view.dart';
import 'package:todoey_flutter/views/notes_view/notes_view.dart';
import 'package:todoey_flutter/views/routines_view/routines_view.dart';
import 'package:todoey_flutter/views/splash_view/splash_view.dart';
import 'package:todoey_flutter/views/test_view.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeHive();
  await initializeBoxes();
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(), child: const MyApp()),
  );
}

Future<void> initializeHive() async {
  ConsoleColor.printInColor('Initializing...', ConsoleColor.green);
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(RoutineAdapter());
  Hive.registerAdapter(DayTimeAdapter());
  Hive.registerAdapter(RoutineItemAdapter());
  Hive.registerAdapter(DailyTaskAdapter());
  Hive.registerAdapter(TaskAdapter());
}

Future<void> initializeBoxes() async {
  await RoutinesViewModel.initRoutineBox();
  await NotesViewModel.initNoteBox();
  await DailyTasksViewModel.initDailyTaskBox();
  ConsoleColor.printInColor('Boxes are ready!', ConsoleColor.green);
  FlutterNativeSplash.remove();
  ConsoleColor.printInColor('Splash screen removed!', ConsoleColor.green);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoutinesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DailyTasksViewModel(),
        ),
      ],
      child: MaterialApp(
        //routerConfig: _appRouter.config(),
        initialRoute: HomeView.path,
        routes: {
          SplashView.path: (context) => const SplashView(),
          HomeView.path: (context) => HomeView(),
          TodoView.path: (context) => TodoView(),
          NotesView.path: (context) => NotesView(),
          RoutinesView.path: (context) => RoutinesView(),
          TestView.path: (context) => const TestView(),
        },
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).currTheme,
      ),
    );
  }
}
