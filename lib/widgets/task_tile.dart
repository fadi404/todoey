import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.deleteTask,
  }) : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final ValueChanged<bool?> checkboxCallback;
  final GestureLongPressCallback deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}
