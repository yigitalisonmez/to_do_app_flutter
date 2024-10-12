class ConsoleColor {
  static const String reset = '\u001B[0m';
  static const String black = '\u001B[30m';
  static const String red = '\u001B[31m';
  static const String green = '\u001B[32m';
  static const String yellow = '\u001B[33m';
  static const String blue = '\u001B[34m';
  static const String magenta = '\u001B[35m';
  static const String cyan = '\u001B[36m';
  static const String white = '\u001B[37m';

  static void printInColor(String message, String color) {
    print('$color$message$reset');
  }
}
