import 'package:flutter/material.dart';

class Startquiz extends StatefulWidget {
  @override
  State<Startquiz> createState() => _StartquizState();
}

class _StartquizState extends State<Startquiz> {
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
      body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: const Text(
                "Questions 1 ",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
              Container(
                  child: const Text(
                "/ 10",
                style: TextStyle(
                    color: Color.fromARGB(241, 227, 215, 215),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ),
            ]
            ),
      ),
    );
  }
}
