import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  void navigateTo(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
