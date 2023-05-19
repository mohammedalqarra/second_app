import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  late Database _database;

  DatabaseController() {
    initDatabase();
  }

  String tableQuestion = 'quizTable';
  String idQuestion = 'id';
  String question = 'question';
  String titleColumn = 'question';
  String firstAnswer = 'firstAnswer';
  String secondAnswer = 'secondAnswer';
  String thirdAnswer = 'thirdAnswer';
  String fourthAnswer = 'fourthAnswer';
  String correctAnswer = 'correctAnswer';

  Future<void> initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'my_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
     CREATE TABLE  $tableQuestion (
      $idQuestion INTEGER PRIMARY KEY AUTOINCREMENT,
      $question TEXT,
      $firstAnswer TEXT,
      $secondAnswer TEXT,
      $thirdAnswer TEXT,
      $fourthAnswer TEXT,
      $correctAnswer TEXT
     )
     ''');
  }

  Future<int> insertData(String name, int age) async {
    final Map<String, dynamic> row = {'name': name, 'age': age};

    return await _database.insert('my_table', row);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    return await _database.query('my_table');
  }

  Future<void> closeDatabase() async {
    await _database.close();
  }
}
