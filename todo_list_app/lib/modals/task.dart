import 'package:flutter/material.dart';

class SubTask {
  // this class is Private to this file only
  // can't access outside this file
  final String title;
  final Key key = UniqueKey();
  bool isCompleted = false;
  SubTask({required this.title});
}

class Task {
  final String title;
  final Key key = UniqueKey();
  final DateTime createdOn = DateTime.now();
  final DateTime? dueDate;
  bool isDue = false;
  bool isCompleted = false;
  final List<SubTask> _subtasks = [];

  Task({
    required this.title,
    required this.dueDate,
  });

  void addSubTask({required String subTaskTitle}) {
    _subtasks.add(SubTask(title: subTaskTitle));
  }

  void deleteSubTask({required Key key}) {
    _subtasks.removeWhere((element) => element.key == key);
  }

  List<SubTask> get subtasks {
    return [..._subtasks];
  }
}
