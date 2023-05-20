import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/app_routes.dart';

class DeleteDialog extends StatefulWidget {
  final int qID;
  const DeleteDialog({Key? key, required this.qID}) : super(key: key);

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Container(
        width: 400, // Set the width of the dialog
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Delete question",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Are you sure you want to delete this question?",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.teal,
            ),
          ),
          onPressed: () {
            // Navigator.of(context).pop(); // Close the dialog
            AppRouter.popWidget();
          },
        ),
        Consumer<DatabaseProvider>(
          builder: (context, databaseProvider, child) {
            return TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              onPressed: () {
                // Perform the delete operation here
                // Navigator.of(context).pop(); // Close the dialog

                databaseProvider.deleteQuestion(widget.qID);
                AppRouter.popWidget();
              },
            );
          },
        ),
      ],
    );
  }
}
