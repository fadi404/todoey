import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (value) {
              taskData.boxChecker(task);
            },
            deleteTask: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
