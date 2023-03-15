import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:statemangementinflutter/models/task.dart';

class TaskData extends ChangeNotifier {
  String data = "helooo";
  final List<Task> _tasks = [
    Task(name: "Go to YOuga"),
    Task(name: "Go to Gim"),
    Task(name: "Go to musics "),
  ];

  //count total task
  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addnewTask(String newtasktext) {
    final task = Task(name: newtasktext);
    _tasks.add(task);
    notifyListeners();
  }
}
