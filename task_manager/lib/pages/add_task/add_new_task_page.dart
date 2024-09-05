import 'package:flutter/material.dart';
import 'package:task_manager/model/task_model.dart';

import '../../helper/local_repository.dart';

class AddNewTaskPage extends StatefulWidget {
  TaskModel? taskModel;

  AddNewTaskPage({super.key, this.taskModel});

  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  final TextEditingController taskController = TextEditingController();

  @override
  void initState() {

    // Setting Task Data to Text Field
    if(widget.taskModel!=null){
      taskController.text = widget.taskModel!.taskName!;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.taskModel != null ? "Update Task" : "Add New Task",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(hintText: "Write here"),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  if (widget.taskModel != null) {
                    _updateTask(context,widget.taskModel!);
                  } else {
                    _saveNewTask(context);
                  }
                },
                child: Text("Save task")),
          ],
        ),
      ),
    );
  }

  _saveNewTask(BuildContext context) async {
    // Todo Save new Task

    if (taskController.text.isEmpty) {
      print("Task is empty");
      return;
    }

    TaskModel taskModel =
        TaskModel(taskName: taskController.text, isCompleted: false);
    await DBProvider.db.addTask(taskModel);
    Navigator.pop(context, true);
  }

  _updateTask(BuildContext context, TaskModel task) async {
    if (taskController.text.isEmpty) {
      print("Task is empty");
      return;
    }
    task.taskName = taskController.text;
    await DBProvider.db.updateTask(task);
    Navigator.pop(context, true);
  }
}
