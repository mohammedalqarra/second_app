import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/Provider/databaseProvider.dart';

class StartQuizWidget extends StatefulWidget {
  const StartQuizWidget({Key? key, required this.dataBaseModel})
      : super(key: key);

  final DataBaseModel dataBaseModel;

  @override
  State<StartQuizWidget> createState() => _StartQuizWidgetState();
}

class _StartQuizWidgetState extends State<StartQuizWidget> {
  int index = 0;
  //Change Notifier or a similar
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
          Container(
                width: 377,
                //height: 40.h,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Text(
                  widget.dataBaseModel.titleQuestion,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('A');
              },
              child: Container(
                width: 377,
                //width: double.infinity,
                padding: const EdgeInsets.all(8),
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
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('B');
              },
              child: Container(
                width: 377,
                // width: double.infinity,
                padding: const EdgeInsets.all(8),
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
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('C');
              },
              child: Container(
                width: 377,
                // width: double.infinity,
                padding: const EdgeInsets.all(8),
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
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                databaseProvider.changeSelectedAnswer('D');
              },
              child: Container(
                width: 377,
                // width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: databaseProvider.selectedAnswer == 'D'
                     ? Colors.green[300]
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
