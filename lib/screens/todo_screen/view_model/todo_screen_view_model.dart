import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

enum Pages { Todo, Notes }

List<Pages> pages = [Pages.Todo, Pages.Notes];

class TodoScreenViewModel extends ChangeNotifier {
  int selectedNavBarIdx = 1;
  void changeSelectedIdx(int idx) {
    print(idx);
    selectedNavBarIdx = idx;
    notifyListeners();
  }

  void navigate(int index, BuildContext context) {
    switch (pages[index]) {
      case Pages.Todo:
        context.router.navigateNamed('/todo-screen');
      case Pages.Notes:
        context.router.navigateNamed('/notes-screen');
    }
  }
}
