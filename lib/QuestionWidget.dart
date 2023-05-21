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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 320,
                child: Text(
                  widget.dataBaseModel.titleQuestion ,
                  style: TextStyle(fontSize: 20, color: Colors.white , backgroundColor: Colors.teal),
                ),
              ),
              const Spacer(),
              GestureDetector(onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        deleteID: widget.dataBaseModel.id!,
                      );
                    });
              },
              child: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 162, 161, 161),
                size: 30),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width:350,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top:10),
            decoration:  BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'A' ? Colors.green[300] : Colors.white,
              
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.dataBaseModel.firstAnswer,
              style: TextStyle(
                              color: widget.dataBaseModel.correctAnswer == 'A'
                      ? Colors.green[300]
                      : Colors.white,
                      fontSize: 20,
              ),
            )
          ),
          Container(
             width:350,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top:10),
            decoration:  BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'B' ? Colors.green[300] : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.dataBaseModel.secondAnswer,
              style: TextStyle(
                              color: widget.dataBaseModel.correctAnswer == 'B'
                      ? Colors.green[300]
                      : Colors.white,
                      fontSize: 20,
              ),
            )
          ),
          Container(
            width:350,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top:10),
            decoration:  BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'C' ? Colors.green[300] : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.dataBaseModel.thirdAnswer,
              style: TextStyle(
                              color: widget.dataBaseModel.correctAnswer == 'C'
                      ? Colors.green[300]
                      : Colors.white,
                      fontSize: 20,
              ),
            )
          ),
           Container(
              width: 350,
              padding: EdgeInsets.all(10),
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
                      ? Colors.green[300]
                      : Colors.white,
                  fontSize: 20,
                ),
              )),
        ],
      ),
    );
  }
}
