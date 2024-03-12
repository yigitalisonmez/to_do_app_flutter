part of 'package:todoey_flutter/views/todo_view/todo_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            const DrawerHeader(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpeg'),
            )),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Todo\'s'),
              onTap: () {
                /// pops drawer
                Navigator.pop(context);

                /// pops current screen
                Navigator.popAndPushNamed(context, TodoView.path);

/*                AutoRouter.of(context).pop();
                AutoRouter.of(context).pop();
                AutoRouter.of(context).popAndPush(const TodoRoute());*/
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_calendar),
              title: const Text('Routines'),
              onTap: () {
                Navigator.popAndPushNamed(context, RoutinesView.path);
/*                AutoRouter.of(context).pop();
                AutoRouter.of(context).push(const RoutinesRoute());*/
              },
            ),
            ListTile(
              leading: const Icon(Icons.sticky_note_2),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, NotesView.path);
/*                AutoRouter.of(context).pop();
                AutoRouter.of(context).popAndPush(NotesRoute());*/
              },
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.book),
              title: Text('Journal'),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6_rounded),
              title: const Text('Change Theme'),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}