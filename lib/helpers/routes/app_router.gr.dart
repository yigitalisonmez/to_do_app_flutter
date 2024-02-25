// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTaskScreen(),
      );
    },
    NoteContentRoute.name: (routeData) {
      final args = routeData.argsAs<NoteContentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoteContentScreen(
          key: args.key,
          noteIndex: args.noteIndex,
          noteContent: args.noteContent,
          isNew: args.isNew,
        ),
      );
    },
    NotesRoute.name: (routeData) {
      final args = routeData.argsAs<NotesRouteArgs>(
          orElse: () => const NotesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotesScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TodoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TodoScreen(),
      );
    },
  };
}

/// generated route for
/// [AddTaskScreen]
class AddTaskRoute extends PageRouteInfo<void> {
  const AddTaskRoute({List<PageRouteInfo>? children})
      : super(
          AddTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoteContentScreen]
class NoteContentRoute extends PageRouteInfo<NoteContentRouteArgs> {
  NoteContentRoute({
    Key? key,
    required int noteIndex,
    required String noteContent,
    required bool isNew,
    List<PageRouteInfo>? children,
  }) : super(
          NoteContentRoute.name,
          args: NoteContentRouteArgs(
            key: key,
            noteIndex: noteIndex,
            noteContent: noteContent,
            isNew: isNew,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteContentRoute';

  static const PageInfo<NoteContentRouteArgs> page =
      PageInfo<NoteContentRouteArgs>(name);
}

class NoteContentRouteArgs {
  const NoteContentRouteArgs({
    this.key,
    required this.noteIndex,
    required this.noteContent,
    required this.isNew,
  });

  final Key? key;

  final int noteIndex;

  final String noteContent;

  final bool isNew;

  @override
  String toString() {
    return 'NoteContentRouteArgs{key: $key, noteIndex: $noteIndex, noteContent: $noteContent, isNew: $isNew}';
  }
}

/// generated route for
/// [NotesScreen]
class NotesRoute extends PageRouteInfo<NotesRouteArgs> {
  NotesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NotesRoute.name,
          args: NotesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NotesRoute';

  static const PageInfo<NotesRouteArgs> page = PageInfo<NotesRouteArgs>(name);
}

class NotesRouteArgs {
  const NotesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NotesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TodoScreen]
class TodoRoute extends PageRouteInfo<void> {
  const TodoRoute({List<PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
