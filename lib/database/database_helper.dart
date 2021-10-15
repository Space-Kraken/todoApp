import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practica3/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'todoDB';
  static final _dbVersion = 1;
  static final _dbTable = 'tasks';

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbDir = join(appDir.path, _dbName);
    return openDatabase(
      dbDir,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // String script = await rootBundle.loadString('assets/scripts/create.sql');
    String script =
        "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(50), description VARCHAR(250), deadline VARCHAR(10), status INTEGER )";
    await db.execute(script);
  }

  // CRUD methods
  Future<int> insert(Map<String, dynamic> row) async {
    var connection = await database;
    return await connection!.insert(_dbTable, row);
  }

  Future<List<TaskModel>> getTask() async {
    var connection = await database;
    var taskList = await connection!.query(_dbTable);
    return taskList.map((task) => TaskModel.fromMap(task)).toList();
  }

  Future<int> update(Map<String, dynamic> row) async {
    var connection = await database;
    return await connection!
        .update(_dbTable, row, where: 'id = ?', whereArgs: [row['id']]);
  }

  Future<int> delete(int id) async {
    var connection = await database;
    return await connection!.delete(_dbTable, where: 'id = ?', whereArgs: [id]);
  }
}
