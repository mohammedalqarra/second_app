import 'package:second_app/Screens/NotQuestion.dart';
import 'package:flutter/material.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: NotQuestion(),
    );
  }
}
