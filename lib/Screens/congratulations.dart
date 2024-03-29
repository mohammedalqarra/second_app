import 'package:flutter/material.dart';

class congratulations extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz app"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 14, 198, 161),
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
                  "Congratuulations!",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Image.asset(
              'lib/assets/result.jpg',
              width: 200,
              height: 200,
            ),
            Container(
              // width: 250,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Your Score : 5 / 10",
                  style: TextStyle(
                    fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: const Text(
                "Keep up the good work!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 198, 161),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Back To home",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
