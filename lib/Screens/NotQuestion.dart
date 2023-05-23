import 'package:flutter/material.dart';
import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/Screens/homepage.dart';

class NotQuestion extends StatefulWidget {
  @override
  _NotQuestionState createState() => _NotQuestionState();
}

class _NotQuestionState extends State<NotQuestion> {
  void navigateToCreateQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewQuestion()),
    );
  }

  void navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 250,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sorry!",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: const Text(
                "You must add at least 5 question to start",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'lib/assets/quiz.png',
              width: 200,
              height: 200,
            ),
            Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                              navigateToHomePage();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Back to Home!",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
