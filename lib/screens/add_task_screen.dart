import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 5.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 5.0,
                  ),
                ),
              ),
              cursorColor: Colors.lightBlueAccent,
              autofocus: true,
              textAlign: TextAlign.center,
              controller: taskController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              height: 60.0,
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(taskController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
