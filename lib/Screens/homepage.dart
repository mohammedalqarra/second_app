import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/Screens/CreateQuiz.dart';
import 'package:second_app/Screens/NotQuestion.dart';
import '../app_routes.dart';
import '../ExitDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: implement initState

  void initState() {
    super.initState();
    Provider.of<DatabaseProvider>(context, listen: false).selectAllQuestions();
  }

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
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(
                  Icons.menu_rounded,
                  size: 30,
                ));
          },
        ),
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
            SizedBox(width: 200, height: 30),
            Consumer<DatabaseProvider>(
                builder: (context, databaseProvider, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {
                  databaseProvider.score = 0;
                  databaseProvider.selectedAnswer = '0';
                  if (databaseProvider.question.length < 5) {
                    AppRouter.pushWidget(NotQuestion());
                  } else {
                    AppRouter.pushWidget(AddNewQuestion());
                  }
                },
                child: const Text(
                  "Let's Start!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }),
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
            // ListTile(
            //   leading: const Icon(Icons.create),
            //   title: const Text('Create Quiz'),
            //   onTap: () {
            //     navigateToCreateQuizPage();
            //   },
            // ),

            TextButton(
              onPressed: () {
                AppRouter.popWidget();
                AppRouter.pushWidget(CreateQuiz());
              },
              child: const ListTile(
                leading: Icon(Icons.create),
                title: Text(
                  'Create Quiz',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // ListTile(
            //   leading: const Icon(Icons.question_mark_outlined),
            //   title: const Text('Start  Quiz'),
            //   onTap: () {
            //     navigateToStartQuizPage();
            //   },
            // ),
            Consumer<DatabaseProvider>(
              builder: (context, databaseProvider, child) {
                return TextButton(
                  onPressed: () {
                    databaseProvider.score = 0;
                    databaseProvider.selectedAnswer = '0';
                    if (databaseProvider.question.length < 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotQuestion(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewQuestion(),
                        ),
                      );
                    }
                  },
                  child: const ListTile(
                    leading: Icon(Icons.quiz),
                    title: Text('Start Quiz'),
                  ),
                );
              },
            ),

            const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.logout),
            //   title: const Text('Exit'),
            //   onTap: () {
            //     exitApp();
            //   },
            // ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return ExitDialog();
                  },
                );
              },
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
