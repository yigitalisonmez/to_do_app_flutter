import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task/task_data.dart';

@RoutePage()
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
