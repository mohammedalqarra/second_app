import 'package:flutter/material.dart';
import '../DataBase/databaseController.dart';
import '../Models/databaseModel.dart';

class DatabaseProvider with ChangeNotifier {
  List<DataBaseModel> questions = [];

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController titleQuestion = TextEditingController();
  TextEditingController firstAnswer = TextEditingController();
  TextEditingController secondAnswer = TextEditingController();
  TextEditingController thirdAnswer = TextEditingController();
  TextEditingController fourthAnswer = TextEditingController();
  String correctAnswer = 'B';

  void insertNewQuestion() {
    DatabaseController().insertNewQuestion(DataBaseModel(
      titleQuestion: titleQuestion.text,
      firstAnswer: firstAnswer.text,
      secondAnswer: secondAnswer.text,
      thirdAnswer: thirdAnswer.text,
      fourthAnswer: fourthAnswer.text,
      correctAnswer: correctAnswer,
    ));

    titleQuestion.text = '';
    firstAnswer.text = '';
    secondAnswer.text = '';
    thirdAnswer.text = '';
    fourthAnswer.text = '';
    correctAnswer = 'B';

    selectAllQuestions();
  }

  void selectAllQuestions() async {
    questions = await DatabaseController().selectAllQuestion();
    notifyListeners();
  }

  void deleteQuestion(int id) async {
    await DatabaseController().deleteQuestion(id);
    selectAllQuestions();
  }
}
