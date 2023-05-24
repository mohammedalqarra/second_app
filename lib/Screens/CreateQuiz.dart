import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/QuestionWidget.dart';
import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/Screens/homepage.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final ScrollController scrollController = ScrollController();

  void navigateToCreateQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void navigateToAddNewQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewQuestion()),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<DatabaseProvider>(context, listen: false).selectAllQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Quiz'),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: databaseProvider.questions.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      const SizedBox(width: double.infinity),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.teal,
                          ),
                          onPressed: navigateToAddNewQuestion,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add, size: 20, color: Colors.white),
                              Text(
                                'Add new question',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'lib/assets/faq.png',
                        width: 250,
                        height: 250,
                      ),
                      const Text(
                        'You must add at least 5 questions to start',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: navigateToCreateQuiz,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Back to Home!',
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
                      const Spacer(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(width: double.infinity),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.teal,
                          ),
                          onPressed: navigateToAddNewQuestion,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add, size: 20, color: Colors.white),
                              Text(
                                'Add new question',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: databaseProvider.questions.length,
                        itemBuilder: (context, int index) {
                          return QuestionWidget(
                            dataBaseModel: databaseProvider.questions[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            backgroundColor: Colors.teal,
            onPressed: navigateToAddNewQuestion,
          ),
        );
      },
    );
  }
}
