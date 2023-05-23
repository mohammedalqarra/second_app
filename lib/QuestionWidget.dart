import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'DeleteDialog.dart';

class QuestionWidget extends StatefulWidget {
  final DataBaseModel dataBaseModel;

  const QuestionWidget({Key? key, required this.dataBaseModel})
      : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 320,
                child: Text(
                  widget.dataBaseModel.titleQuestion,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      backgroundColor: Colors.teal),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteDialog(
                          deleteID: widget.dataBaseModel.id!,
                        );
                      });
                },
                child: const Icon(Icons.delete,
                    color: Colors.blueGrey, size: 30),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
              width: 350,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: widget.dataBaseModel.correctAnswer == 'A'
                    ? Colors.green[300]
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.dataBaseModel.firstAnswer,
                style: TextStyle(
                  color: widget.dataBaseModel.correctAnswer == 'A'
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: widget.dataBaseModel.correctAnswer == 'B'
                    ? Colors.green[300]
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.dataBaseModel.secondAnswer,
                style: TextStyle(
                  color: widget.dataBaseModel.correctAnswer == 'B'
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: widget.dataBaseModel.correctAnswer == 'C'
                    ? Colors.green[300]
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.dataBaseModel.thirdAnswer,
                style: TextStyle(
                  color: widget.dataBaseModel.correctAnswer == 'C'
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                ),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: widget.dataBaseModel.correctAnswer == 'D'
                    ? Colors.green[300]
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.dataBaseModel.fourthAnswer,
                style: TextStyle(
                  color: widget.dataBaseModel.correctAnswer == 'D'
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                ),
              )),
        ],
      ),
    );
  }
}
