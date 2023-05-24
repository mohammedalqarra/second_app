import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import '../StartQuizWidget.dart';
import '../ExitDialog.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({
    Key? key,
  }) : super(key: key);

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
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Question ${currentIndex + 1}',
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/${databaseProvider.questions.length}',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed:
                            currentIndex == databaseProvider.questions.length - 1
                                ? () {
                          print('before condition');
                                    if (databaseProvider.selectedAnswer ==
                                        databaseProvider.questions[currentIndex]
                                            .correctAnswer) {
                                      print('after condition');
                                      databaseProvider.score++;
                                      log(databaseProvider.score.toString());
                                    }
                                    databaseProvider.calculateResult();
                                    Navigator.of(context)
                                        .pushReplacementNamed('/resultQuiz');
                                  }
                                : (){
                          print('bbbbbbbbbbbbbbb');
                            },
                        child: const Text(
                          'Finished',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed:
                            currentIndex < databaseProvider.questions.length- 1

                                ? () {
                          print('beforee');
                                    if (databaseProvider.selectedAnswer ==
                                        databaseProvider.questions[currentIndex]
                                            .correctAnswer) {
                                      print('afterr');
                                      databaseProvider.score++;
                                      log(databaseProvider.score.toString());
                                    }
                                    nextItem();
                          print('after2');
                                    databaseProvider.changeSelectedAnswer('0');
                                  }
                                : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Next',
                              style: TextStyle(fontSize: 20),
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
