import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangementinflutter/widget/tasltile.dart';

import '../models/task_data.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: ((context, taskData, child) {
      return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: ((context, index) {
            return ListTileee(
              taskTitle: taskData.tasks[index].name!,
              isChecked: taskData.tasks[index].isDone,
              checkedCallback: (chexkedState) {
                setState(() {
                  taskData.tasks[index].toogleDone();
                });
              },
            );
          }));
    }));
  }
}
