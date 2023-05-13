import 'package:flutter/material.dart';

class Startquiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz app"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 198, 161),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(),
    );
  }
}
