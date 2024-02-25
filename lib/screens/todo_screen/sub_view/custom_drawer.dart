part of '../todo_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.homeScreenPath,
  });

  final String homeScreenPath;

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
              title: const Text('Home'),
              onTap: () {
                /// Yanlış bir kullanım
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, homeScreenPath);
              },
            ),
            const ListTile(
              leading: Icon(Icons.edit_calendar),
              title: Text('Routines'),
            ),
            ListTile(
              leading: const Icon(Icons.sticky_note_2),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, NotesScreen.notesScreenPath);
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
