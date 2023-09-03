import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import '../Models/databaseModel.dart';

class DatabaseController {
  //late Database _database;
  static DatabaseController quizDatabase = DatabaseController();

  DatabaseController() {
    initDatabase();
  }

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

  // initDatabase() async {
  //   database = await createConnectionWithDatabase();
  // }

  Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'my_database.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );

    // database = _database;
  }

  Future<void> _createTable(Database db, int version) async {

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

    return await database!.insert('my_table', row);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    return await database!.query('my_table');
  }

  Future<void> closeDatabase() async {
    await database?.close();
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
