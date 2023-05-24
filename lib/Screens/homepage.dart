import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/Screens/CreateQuiz.dart';
import 'package:second_app/Screens/NotQuestion.dart';
import 'package:second_app/Screens/StartQuiz.dart';
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
        title: const Text(
          "Quiz app",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/quiz.png',
              width: 500,
              height: 300,
            ),
            SizedBox(width: 200, height: 30),
            Consumer<DatabaseProvider>(
                builder: (context, databaseProvider, child) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    databaseProvider.score = 0;
                    databaseProvider.selectedAnswer = '0';
                    if (databaseProvider.questions.length < 5) {
                      AppRouter.pushWidget(NotQuestion());
                    } else {
                      AppRouter.pushWidget(StartQuiz());
                    }
                  },
                  child: Container(
                    width: 170,
                    height: 30, // Replace 200 with your desired width value
                    padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal:
                            30), // Replace 8.0 with your desired padding value
                    child: const Text(
                      "Let's Start!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ));
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
                    AppRouter.popWidget();
                    if (databaseProvider.questions.length < 5) {
                      AppRouter.pushWidget(NotQuestion());
                    } else {
                      AppRouter.pushWidget(StartQuiz());
                    }
                  },
                  child: const ListTile(
                    leading: Icon(Icons.quiz),
                    title: Text('Start Quiz'),
                  ),
                );
              },
            ),

            const Divider(
              thickness: 1,
            ),
            // ListTile(
            //   leading: const Icon(Icons.logout),
            //   title: const Text('Exit'),
            //   onTap: () {
            //     exitApp();
            //   },
            // ),

            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return ExitDialog();
                //   },
                // );

                AppRouter.popWidget();
                showDialog(context: context , builder: (context){
                  return ExitDialog();
                });
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
