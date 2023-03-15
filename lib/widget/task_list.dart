import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangementinflutter/widget/tasltile.dart';

import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: ((context, taskData, child) {
      return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: ((context, index) {
            final tasked = taskData.tasks[index];
            return ListTileee(
              taskTitle: tasked.name!,
              isChecked: tasked.isDone,
              checkedCallback: (chexkedState) {
                taskData.updateTask(tasked);
              },
              longPress: () {
                taskData.deleteTask(tasked);
              },
            );
          }));
    }));
  }
}
