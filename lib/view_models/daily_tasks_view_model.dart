import 'package:flutter/cupertino.dart';
import 'package:grock/grock.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/daily_task/daily_task.dart';
import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  static String dateToString(DateTime givenDate) {
    // Create a DateFormat object with the desired format
    final DateFormat formatter = DateFormat('dd-MM-yy');
    // Format the given date
    return formatter.format(givenDate);
  }

  static bool isToday(DateTime date) {
    DateTime today = DateTime.now();
    return today.year == date.year &&
        today.month == date.month &&
        today.day == date.day;
  }
}

/// ! günlük yapılacak tasklar.(Dates act as keys)
class DailyTasksViewModel extends ChangeNotifier {
  late Box<DailyTask> dailyTaskBox;
  int taskNumber = 0;
  bool isLoading = true;

  DailyTasksViewModel() {
    _initRoutineBox();
  }

  void _initRoutineBox() async {
    isLoading = true;
    dailyTaskBox = await Hive.openBox('daily_tasks');
    isLoading = false;
    notifyListeners();
  }

  ///Create
  void createDailyTask(DailyTask dailyTask) {
    dailyTaskBox.put(DateTimeEx.dateToString(dailyTask.date), dailyTask);
  }

  /// READ
  DailyTask? getDailyTask(String key) {
    /// Daha önce hiç daily planning açılmadıysa veya bugün için açılmadıysa
    if (dailyTaskBox.values.isEmpty ||
        !(DateTimeEx.isToday(dailyTaskBox.values.last.date))) {
      DateTime now = DateTime.now();
      createDailyTask(
        DailyTask(id: DateTimeEx.dateToString(now), tasks: [], date: now),
      );
    }
    DailyTask? dailyTask = dailyTaskBox.get(key);
    taskNumber = dailyTask!.tasks.length;
    return dailyTask;
  }

  /// UPDATE
  //Add task to dailyTasks
  void addTask({required Task newTask, required String date}) {
    DailyTask? dailyTasks = getDailyTask(date);
    if (dailyTasks!.isNotNull) {
      dailyTasks.tasks.add(newTask);
      dailyTaskBox.put(date, dailyTasks);
    }
    taskNumber++;
    notifyListeners();
  }

  /// Delete task from dailyTasks
  void deleteTask({required String date, required int index}) {
    DailyTask? dailyTasks = getDailyTask(date);
    if (dailyTasks!.isNotNull) {
      dailyTasks.tasks.removeAt(index);
      dailyTaskBox.put(date, dailyTasks);
    }
    taskNumber--;
    notifyListeners();
  }

  void updateTaskStatus({required String key, required int taskIdx}) {
    DailyTask? dailyTasks = getDailyTask(key);
    if (dailyTasks!.isNotNull) {
      dailyTasks.tasks[taskIdx].isDone = !dailyTasks.tasks[taskIdx].isDone;
      dailyTaskBox.put(key, dailyTasks);
    }
    notifyListeners();
  }

  // Updates title of the task and reward
  void updateTask({
    required String updatedTaskTitle,
    required int updatedTaskReward,
    required String key,
    required int taskIdx,
  }) {
    DailyTask? dailyTasks = getDailyTask(key);
    if (dailyTasks!.isNotNull) {
      dailyTasks.tasks[taskIdx].title = updatedTaskTitle;
      dailyTasks.tasks[taskIdx].reward = updatedTaskReward;
      dailyTaskBox.put(key, dailyTasks);
    }
    notifyListeners();
  }
}
