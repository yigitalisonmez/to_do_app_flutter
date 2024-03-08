part of '../todo_view.dart';

final iconList = <IconData>[
  Icons.home,
  Icons.brightness_4,
  Icons.brightness_6,
  Icons.brightness_7,
];
bottomNavigationBar(BuildContext context) {
  var provider = Provider.of<TodoScreenViewModel>(context, listen: false);
  return CurvedNavigationBar(
    index: provider.selectedNavBarIdx,
    color: kScaffoldBackgroundColorDark,
    backgroundColor: Theme.of(context).colorScheme.primary,
    /*onTap: (idx) => provider.navigate(idx, context),*/
    items: const [
      Icon(CupertinoIcons.home),
      Icon(Icons.sticky_note_2),
    ],
  );
}

/*
animatedNavigationBar(BuildContext context) {
  return AnimatedBottomNavigationBar.builder(
    itemCount: 4,
    icons: iconList,
    activeIndex: 2,
    onTap: (int index) {},
    tabBuilder: (int index, bool isActive) {},
  );
}
*/
