import 'package:flutter/material.dart';
import 'package:second_app/DeleteDialog.dart';
import 'package:second_app/Models/databaseModel.dart';

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
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.dataBaseModel.titleQuestion,
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeleteDialog(
                        deleteID: widget.dataBaseModel.id!,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.blueGrey,
                  size: 22,
                ),
              ),
            ],
          ),
          Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0 , vertical:10),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'A'
                  ? Colors.green.shade400
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
              textAlign: TextAlign.center,
            ),
          ),
          Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0 , vertical:10),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'B'
                  ? Colors.green.shade400
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
              textAlign: TextAlign.center,
            ),
          ),
          Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0 , vertical:10),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'C'
                  ? Colors.green.shade400
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
              textAlign: TextAlign.center,
            ),
          ),
          Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0 , vertical:10),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.dataBaseModel.correctAnswer == 'D'
                  ? Colors.green.shade400
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
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
