import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task/task_data.dart';
import 'package:todoey_flutter/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String splashScreenPath = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  loadTasks(BuildContext ctx) async {
    await TaskData().loadTasks(ctx);
  }

  @override
  void initState() {
    super.initState();
    loadTasks(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
