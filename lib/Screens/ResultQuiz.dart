import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/Screens/homepage.dart';

class ResultQuiz extends StatefulWidget {
  final int score;

  ResultQuiz({required this.score});

  @override
  _ResultQuizState createState() => _ResultQuizState();
}

class _ResultQuizState extends State<ResultQuiz> {
  String resultMessage = '';
  String resultTitle = '';
  String imagePath = '';
  int score = 0;

  
  @override
  void initState() {
    super.initState();
    calculateResult();
  }

  void calculateResult() {
    double scorePercentage = (widget.score / 100) * 100;

    if (scorePercentage >= 75) {
      resultMessage = 'Congratulations!';
      resultTitle = "You're a superstar!";
      imagePath = 'lib/assets/result.jpg';
    } else if (scorePercentage >= 50) {
      resultMessage = 'Congratulations!';
      resultTitle = "Keep up the good work!";
      imagePath = 'lib/assets/result.jpg';
    } else {
      resultMessage = 'Oops!';
      resultTitle = 'Sorry, better luck next time!';
      imagePath = 'lib/assets/fail.png';
    }
  }

  void navigateToResultQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz app"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 14, 198, 161),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                resultMessage,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              imagePath,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Score: ${widget.score}%',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                resultTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the home page
                  // Navigator.pop(context);
                  navigateToResultQuiz();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         // width: 250,
      //         child: const Padding(
      //           padding: EdgeInsets.all(10),
      //           child: Text(
      //             "Oopps!",
      //             style: TextStyle(
      //                 color: Colors.green,
      //                 fontSize: 24,
      //                 fontWeight: FontWeight.bold),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //       Image.asset(
      //         'lib/assets/fail.png',
      //         width: 200,
      //         height: 200,
      //       ),
      //       Container(
      //         // width: 250,
      //         child: const Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 10),
      //           child: Text(
      //             'Your Score : 2 / 10',
      //             style: TextStyle(
      //                 fontSize: 15,
      //                 color: Colors.green,
      //                 fontWeight: FontWeight.bold),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      // Container(
      //   child: const Text(
      //     "Sorry, better luck next time!",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 16,
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      //       SizedBox(height: 20),
      //       Container(
      //         width: 200,
      // decoration: BoxDecoration(
      //   color: Color.fromARGB(255, 14, 198, 161),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(10),
      //           child: Text(
      //             "Back To home",
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //             ),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),