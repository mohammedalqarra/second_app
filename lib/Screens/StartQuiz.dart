import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/Screens/CreateQuiz.dart';
import 'package:second_app/Screens/NotQuestion.dart';
import 'package:second_app/StartQuiz.dart';
import '../app_routes.dart';
import '../ExitDialog.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  int index = 0;
  ScrollController scrollController = ScrollController();

  void initState() {
    super.initState();
  }

  void nextItem() {
    setState(() {
      index++;
    });
    scrollController.animateTo(index * 377,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz app"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 14, 198, 161),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          
        ),
      );
    });
  }
}
