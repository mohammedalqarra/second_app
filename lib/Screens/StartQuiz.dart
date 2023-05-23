import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import '../StartQuizWidget.dart';
import '../app_routes.dart';
import '../ExitDialog.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key, required })
      : super(key: key);

  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  int currentIndex = 0;
  ScrollController scrollController = ScrollController();

  void nextItem() {
    setState(() {
      currentIndex++;
    });
    scrollController.animateTo(
      currentIndex * 377,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 400),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Question ${currentIndex + 1}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '/${databaseProvider.questions.length}',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 377,
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: databaseProvider.questions.length,
                  itemBuilder: (context, int currentIndex) {
                    return StartQuizWidget(
                      dataBaseModel: databaseProvider.questions[currentIndex],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        fixedSize: const Size(120, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed:
                        currentIndex == databaseProvider.questions.length - 1
                            ? () {
                                if (databaseProvider.secondAnswer ==
                                    databaseProvider.questions[currentIndex]
                                        .correctAnswer) {
                                  databaseProvider.score++;
                                  log(databaseProvider.score.toString() as num);
                                }
                                databaseProvider.calculateResult();
                                Navigator.of(context)
                                    .pushReplacementNamed('/resultQuiz');
                              }
                            : null,
                    child: const Text(
                      'Finished',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        fixedSize: Size(120, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed:
                        currentIndex < databaseProvider.questions.length - 1
                            ? () {
                                if (databaseProvider.selectedAnswer ==
                                    databaseProvider.questions[currentIndex]
                                        .correctAnswer) {
                                  databaseProvider.score++;
                                  log(databaseProvider.score.toString() as num);
                                }
                                nextItem();
                                databaseProvider.changeSelectedAnswer('0');
                              }
                            : null,
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
