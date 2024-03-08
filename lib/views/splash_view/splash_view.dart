import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task/task_data.dart';

class SplashView extends StatefulWidget {
  static String path = '/splash-view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  loadTasks(BuildContext ctx) async {
    await TaskData().loadTasks(ctx);
  }

  @override
  void initState() {
    super.initState();
    loadTasks(context);
  }

/*  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<TaskData>(context).loadTasks(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TodoScreen(); // Your widget when initialization is complete
          } else {
            return SplashScreen(); // Your loading indicator or placeholder
          }
        });
  }*/

  @override
  Widget build(BuildContext context) {
    print('Splash screen e girdim');
    return const Scaffold(
      body: Center(
        child: Text('SplashScreen') /*CircularProgressIndicator()*/,
      ),
    );
  }
}
