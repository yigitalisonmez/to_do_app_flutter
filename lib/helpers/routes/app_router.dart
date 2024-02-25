import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/screens/add_task_screen/add_task_screen.dart';
import 'package:todoey_flutter/screens/todo_screen/todo_screen.dart';
import 'package:todoey_flutter/screens/notes_screen/notes_screen.dart';
import 'package:todoey_flutter/screens/splash_screen/splash_screen.dart';

import '../../screens/notes_screen/note_content_screen.dart';
part 'app_router.gr.dart';

const String todoScreenPath = '/todo-screen-page';
const String splashScreenPath = '/splash-screen';
const String addTaskScreenPath = '/add-task-screen';
const String notesScreenPath = '/notes-screen';
const String noteContentScreenPath = '/note-content-screen';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TodoRoute.page, path: todoScreenPath, initial: true),
        AutoRoute(page: SplashRoute.page, path: splashScreenPath),
        AutoRoute(page: AddTaskRoute.page, path: addTaskScreenPath),
        AutoRoute(page: NotesRoute.page, path: notesScreenPath),
        AutoRoute(page: NoteContentRoute.page, path: noteContentScreenPath),
      ];
}
