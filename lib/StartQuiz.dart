import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/app_routes.dart';

class StartQuiz extends StatefulWidget {
  final DataBaseModel dataBaseModel;

  const StartQuiz({Key? key, required this.dataBaseModel}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  //Change Notifier or a similar
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //width: 380,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.dataBaseModel.titleQuestion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('A');
              },
              child: Container(
                // width: 380,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: databaseProvider.selectedAnswer == 'A'
                      ? Colors.green[300]
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.teal,
                    width: 2,
                  ),
                ),
                child: Text(
                  widget.dataBaseModel.firstAnswer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('B');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: databaseProvider.selectedAnswer == 'B'
                        ? Colors.green[300]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.teal,
                      width: 2,
                    )),
                child: Text(
                  widget.dataBaseModel.secondAnswer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('C');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: databaseProvider.selectedAnswer == 'C'
                      ? Colors.green[300]
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.teal,
                    width: 2,
                  ),
                ),
                child: Text(
                  widget.dataBaseModel.thirdAnswer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('D');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: databaseProvider.selectedAnswer == 'D'
                      ? Colors.grey[300]
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.teal,
                    width: 2,
                  ),
                ),
                child: Text(
                  widget.dataBaseModel.fourthAnswer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
