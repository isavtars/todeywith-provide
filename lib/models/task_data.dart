import 'package:flutter/cupertino.dart';
import 'package:statemangementinflutter/models/task.dart';

class TaskData extends ChangeNotifier {
  String data = "helooo";
  List<Task> tasks = [
    Task(name: "Go to YOuga"),
    Task(name: "Go to Gim"),
    Task(name: "Go to musics "),
  ];

  //count total task
  int get taskCount {
    return tasks.length;
  }
  
  void addnewTask(String newtasktext) {
    final task = Task(name: newtasktext);
    tasks.add(task);
    notifyListeners();
  }
}
