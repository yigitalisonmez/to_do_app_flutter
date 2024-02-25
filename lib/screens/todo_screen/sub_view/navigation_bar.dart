part of '../todo_screen.dart';

_bottomNavigationBar(BuildContext context) {
  var provider = Provider.of<TodoScreenViewModel>(context, listen: false);
  return CurvedNavigationBar(
    index: provider.selectedNavBarIdx,
    color: kScaffoldBackgroundColorDark,
    backgroundColor: Theme.of(context).colorScheme.primary,
    onTap: (idx) => provider.changeSelectedIdx(idx),
    items: [
      Icon(CupertinoIcons.add),
      Icon(CupertinoIcons.home),
      Icon(Icons.sticky_note_2),
    ],
  );
}
