import 'package:flutter/cupertino.dart';

enum Pages { Todo, Notes, Routines }

class TodoScreenViewModel extends ChangeNotifier {
  int selectedNavBarIdx = 1;
  void changeSelectedIdx(int idx) {
    print(idx);
    selectedNavBarIdx = idx;
    notifyListeners();
  }

  void navigate(int index) {
/*    switch (Pages.Todo) {
      case Pages.Todo:
    }*/
  }
}
