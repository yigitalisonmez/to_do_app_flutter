import 'dart:math';

import 'package:flutter/cupertino.dart';

class RoutinesViewModel extends ChangeNotifier {
  void toggleIsOpen(ValueNotifier<bool> isOpen) {
    isOpen.value = !(isOpen.value);
    notifyListeners();
  }
}
