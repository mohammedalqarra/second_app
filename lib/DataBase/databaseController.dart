import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/databaseModel.dart';

class DatabaseController {
  late Database _database;

  DatabaseController() {
    initDatabase();
  }
  // The Database Controller class is defined, representing a controller for managing the database operations.

  static String tableQuestion = 'quizTable';
  static String questionId = 'id';
  static String titleQuestion = 'question';
  static String firstAnswer = 'firstAnswer';
  static String secondAnswer = 'secondAnswer';
  static String thirdAnswer = 'thirdAnswer';
  static String fourthAnswer = 'fourthAnswer';
  static String correctAnswer = 'correctAnswer';

  Database? database;

  // questions is a list of DataBaseModel objects that will store the retrieved questions from the database.
  List<DataBaseModel> questions = [];

  Future<void> initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'my_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );

    database = _database;
  }

  // the database by opening a connection.
  Future<void> _createTable(Database db, int version) async {
    // it executes an SQL command to create a table with the provided table and column names.

    await db.execute('''
     CREATE TABLE  $tableQuestion (
      $questionId INTEGER PRIMARY KEY AUTOINCREMENT,
      $titleQuestion TEXT,
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

  Future<void> insertNewQuestion(DataBaseModel dataBaseModel) async {
    int rowIndex = await database!.insert(tableQuestion, dataBaseModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<DataBaseModel>> selectAllQuestion() async {
    List<Map<String, Object?>> rowsAsMap = await database!.query(tableQuestion);
    questions = rowsAsMap.map((e) => DataBaseModel.fromMap(e)).toList();

    return questions;
  }

  deleteQuestion(int id) {
    database!.delete(tableQuestion, where: '$questionId=?', whereArgs: [id]);
  }
}
