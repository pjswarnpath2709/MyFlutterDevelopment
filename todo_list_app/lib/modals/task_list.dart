import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/task.dart';

class TaskList {
  final String listTitle;
  final Key key = UniqueKey();

  final List<Task> _taskList = [];
  TaskList({
    required this.listTitle,
  });

  void addNewTask({
    required String title_,
    required DateTime dueDate_,
  }) {
    _taskList.add(
      Task(
        title: title_,
        dueDate: dueDate_,
      ),
    );
  }

  void deleteTask({required Key key}) {
    _taskList.removeWhere((element) => element.key == key);
  }
}

class GroupTaskList with ChangeNotifier {
  final Key key = UniqueKey();
  final Set<String> _compulsoryGroups = {
    'Daily Tasks',
    'Important Tasks',
    'All Uncompleted Tasks',
    'CompletedTasks',
    'Planned Tasks',
    'All Tasks'
  };
  final _groupTaskList = {
    'Daily Tasks': TaskList(
      listTitle: 'Daily Tasks',
    ),
    'Important Tasks': TaskList(
      listTitle: 'Important Tasks',
    ),
    'All Uncompleted Tasks': TaskList(
      listTitle: 'All Uncompleted Tasks',
    ),
    'CompletedTasks': TaskList(
      listTitle: 'CompletedTasks',
    ),
    'Planned Tasks': TaskList(
      listTitle: 'Planned Tasks',
    ),
    'All Tasks': TaskList(
      listTitle: 'All Tasks',
    ),
  };

  bool addNewTaskList(String title) {
    // agar woh phele se hi compulsory tasklist hai
    if (_compulsoryGroups.contains(title)) {
      return false;
    }
    _groupTaskList.putIfAbsent(
      title,
      () => TaskList(
        listTitle: title,
      ),
    );
    notifyListeners();
    return true;
  }

  Map<String, TaskList> get groupTaskList {
    return {..._groupTaskList};
  }

  bool deleteTaskList(String title) {
    if (_compulsoryGroups.contains(title)) {
      return false;
    }
    _groupTaskList.remove(title);
    notifyListeners();
    return true;
  }

  List<String> get titlesOfCompulsoryList {
    return _compulsoryGroups.toList();
  }

  List<TaskList> get taskListObjectOfCompulsoryList {
    List<TaskList> taskListObjectList = [];
    _groupTaskList.forEach(
      (key, value) {
        if (_compulsoryGroups.contains(key)) {
          taskListObjectList.add(value);
        }
      },
    );
    return taskListObjectList;
  }

  List<String> get titlesOfUserDefinedTaskList {
    final allKeys = _groupTaskList.keys.toList();
    final userDefinedKeys = <String>[];
    for (var ele in allKeys) {
      if (!_compulsoryGroups.contains(ele)) {
        userDefinedKeys.add(ele);
      }
    }
    return userDefinedKeys;
  }
}
