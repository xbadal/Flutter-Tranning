import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/task_model.dart';

// Database Provided

class DBProvider {
  DBProvider._();

  final String _taskTableName = "tasks";

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  // Initialization of Database
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "anytask.db");


    return await openDatabase(path, version: 1, onOpen: (db) {


    },
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $_taskTableName ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "taskName TEXT,"
          "isCompleted BOOLEAN,"
          "createdDate INTEGER"
          ")");


    });
  }

  // Add New Entry In the Database
  Future<int> addTask(TaskModel task) async {
    final db = await database;
    var res = await db.rawInsert("INSERT Into $_taskTableName (taskName,"
        "isCompleted,"
        "createdDate )"
        " VALUES "
        "('${task.taskName}',"
        "${task.isCompleted},"
        "'${DateTime.now().millisecondsSinceEpoch}')");
    return res;
  }

  //Retrieve All the Task from table
  Future<List<TaskModel>> getAllTask() async {
    final db = await database;
    var res = await db.query(_taskTableName);

    List<TaskModel> list =
        res.isNotEmpty ? res.map((c) => TaskModel.fromJson(c)).toList() : [];
    return list;
  }

  //Retrieve All the Task from table base on Completion
  Future<List<TaskModel>> getAllTaskByStatus(bool isCompleted) async {
    final db = await database;
    String whereString = 'isCompleted = ?';
    List<dynamic> whereArguments = [isCompleted];
    var res = await db.query(_taskTableName,
        where: whereString, whereArgs: whereArguments);
    List<TaskModel> list =
        res.isNotEmpty ? res.map((c) => TaskModel.fromJson(c)).toList() : [];
    return list;
  }

  // Retrieve Task by ID
  Future<List<TaskModel>> getTaskById(String taskId) async {
    final db = await database;
    String whereString = 'id = ?';
    List<dynamic> whereArguments = [taskId];
    List<Map> res = await db.query(_taskTableName,
        where: whereString, whereArgs: whereArguments);
    List<TaskModel> list =
        res.isNotEmpty ? res.map((c) => TaskModel.fromJson(c)).toList() : [];
    return list;
  }

  // Delete Task by ID
  deleteTask(int id) async {
    final db = await database;
    return db.delete(_taskTableName, where: "id = ?", whereArgs: [id]);
  }

  // Update task by Id
  updateTask(TaskModel task) async {
    try {
      final db = await database;
      Map<String, dynamic> row = {
        'taskName': task.taskName,
        "isCompleted": task.isCompleted,
        "createdDate": task.createDate,
      };

      int result = await db
          .update(_taskTableName, row, where: "id = ?", whereArgs: [task.id]);
      return result;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  updateTaskStatus(int id, bool status) async {
    try {
      final db = await database;
      Map<String, dynamic> row = {
        "isCompleted": status,
      };
      int result = await db
          .update(_taskTableName, row, where: "id = ?", whereArgs: [id]);
      return result;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  // Delete all the Items from the Table
  deleteAll() async {
    final db = await database;
    db.delete(_taskTableName);
    // db.rawDelete("DELETE * FROM ${_taskTableName}");
  }
}
