import 'package:flutter/material.dart';
import 'package:todoey_flutter/helper/theme_provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'helper/theme_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          HomeScreen.homeScreenPath: (context) => const HomeScreen(),
          AddTaskScreen.addTaskScreenPath: (context) => AddTaskScreen(),
        },
        theme: Provider.of<ThemeProvider>(context).currTheme,
      ),
    );
  }
}
