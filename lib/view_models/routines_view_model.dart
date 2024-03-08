import 'dart:math';

import 'package:flutter/cupertino.dart';

class RoutinesViewModel extends ChangeNotifier {
  getRandomInt(int number) {
    return (Random().nextInt(number) + 1);
  }
}
