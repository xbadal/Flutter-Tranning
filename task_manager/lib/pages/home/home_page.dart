import 'package:flutter/material.dart';
import 'package:task_manager/helper/local_repository.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/pages/add_task/add_new_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> tasks = [];

  bool isLoading = true;

  @override
  void initState() {
    fetchAllTasks();
    super.initState();
  }

  Future<void> fetchAllTasks() async {
    try {
      tasks = await DBProvider.db.getAllTask();
    } catch (e) {
      print(e);
      tasks = [];
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Manager",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              fetchAllTasks();
            },
            icon: Icon(Icons.refresh),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              _deleteAllTask();
            },
            icon: Icon(Icons.delete_sweep),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "No Task found",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _updateTask(tasks[index]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: tasks[index].isCompleted,
                                  onChanged: (value) {
                                    _changeStatus(tasks[index].id!, value!);
                                  }),
                              Expanded(
                                child: Text(
                                  tasks[index].taskName!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _deleteTask(tasks[index].id!);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: tasks.length,
                  shrinkWrap: true,
                ),

      // Bottom Bar to Add New Task
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        height: 70,
        child: TextButton(
          onPressed: () => _addNewTask(context),
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            "Add New Task",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addNewTask(BuildContext context) async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewTaskPage(),
        ));

    if (result == true) {
      fetchAllTasks();
    }
  }

  _deleteTask(int id) async {
    DBProvider.db.deleteTask(id);
    fetchAllTasks();
  }

  _changeStatus(int id, bool status) async {
    await DBProvider.db.updateTaskStatus(id, status);
    fetchAllTasks();
  }

  _deleteAllTask() async {
    await DBProvider.db.deleteAll();
    fetchAllTasks();
  }

  _updateTask(TaskModel task) async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewTaskPage(
            taskModel: task,
          ),
        ));

    if (result == true) {
      fetchAllTasks();
    }
  }
}




























