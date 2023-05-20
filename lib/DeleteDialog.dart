import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/Provider/databaseProvider.dart';

class DeleteDialog extends StatefulWidget {
  final int qID;
  const DeleteDialog({Key? key, required this.qID}) : super(key: key);

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog();
  }
}
