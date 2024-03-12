import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/widgets/custom_shimmer.dart';
import 'package:todoey_flutter/models/task/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/views/test_view.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';

class SplashView extends StatefulWidget {
  static String path = '/splash-view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isFirstTime = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<TaskData>(context).loadTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const TodoView(); // Your widget when initialization is complete
          } else {
            return const TestView(); // Your loading indicator or placeholder
          }
        });
  }

/*  @override
  Widget build(BuildContext context) {
    print('Splash screen e girdim');
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }*/
}
