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
                  widget.dataBaseModel.question,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Spacer(),
              GestureDetector(onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        qID: widget.dataBaseModel.id!,
                      );
                    });
              },
              child: Icon(Icons.delete, color: Colors.teal[100] ,  size: 30),
              ),
            ],
          ),

          
        ],
      ),
    );
  }
}
