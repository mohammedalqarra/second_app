import 'package:flutter/material.dart';
import 'package:second_app/AddNewQuestion.dart';
import 'package:second_app/CreateQuiz.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void navigateToCreateQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewQuestion()),
    );
  }

  void navigateToStartQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateQuiz()),
    );
  }

  void exitApp() {}
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
            Image.asset(
              'lib/assets/quiz.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  navigateToStartQuizPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Text(
                  "Let's Start!",
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
      drawer: Drawer(
        elevation: 25,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Mohammed'),
              accountEmail: Text('moh@gmail.com'),
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  "M",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Create Quiz'),
              onTap: () {
                navigateToCreateQuizPage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark_outlined),
              title: const Text('Start  Quiz'),
              onTap: () {
                navigateToStartQuizPage();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Exit'),
              onTap: () {
                exitApp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
