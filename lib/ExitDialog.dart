import 'dart:io';

import 'package:flutter/material.dart';
import 'package:second_app/app_routes.dart';

class ExitDialog extends StatefulWidget {
  @override
  State<ExitDialog> createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Do you want to exit the app?',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: Text(
        'Are you sur?',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        ElevatedButton(
          // onPressed: () => Navigator.pop(context, false),
          // child: const Text('No'),
          onPressed: () {
            AppRouter.popWidget();
          },
          child: const Text(
            'No',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          // onPressed: () => Navigator.pop(context, true),
          onPressed: () {
            exit(0);  
          },
          child: const Text(
          'Yes',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ],
    );
  }
}
