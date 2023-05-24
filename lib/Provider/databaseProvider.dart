import 'package:flutter/material.dart';
import '../DataBase/databaseController.dart';
import '../Models/databaseModel.dart';

// The Database Provider class acts as a bridge between the UI components and the Database Controller
class DatabaseProvider with ChangeNotifier {
  List<DataBaseModel> questions = [];
  // form State is a Global Key object that is used to manage the state of the form in the UI.
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController titleQuestion = TextEditingController();
  TextEditingController firstAnswer = TextEditingController();
  TextEditingController secondAnswer = TextEditingController();
  TextEditingController thirdAnswer = TextEditingController();
  TextEditingController fourthAnswer = TextEditingController();
  String correctAnswer = 'A';

  int score = 0;
  String selectedAnswer = '0';
  changeSelectedAnswer(String selected) {
    selectedAnswer = selected;
    notifyListeners();
  }

  String resultTitle = '';
  String imagePath = '';
  String resultMessage = '';

  calculateResult() {
    double  scorePercentage  = score / questions.length;
    if (scorePercentage >=  0.75) {
      resultTitle = 'Congratulations!';
      imagePath = 'lib/assets/result.jpg';
      resultMessage = "You're a superstar!";
    } else if (scorePercentage >=  0.50 ) {
      resultTitle = 'Congratulations!';
      imagePath = 'lib/assets/result.jpg';
      resultMessage = "Keep up the good work!";
    } else {
      resultTitle = 'Oops!';
      imagePath = 'lib/assets/fail.png';
      resultMessage = "Sorry, better luck next time!";
    }
  }

  void insertNewQuestion() {
    DatabaseController.quizDatabase.insertNewQuestion(DataBaseModel(
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
    correctAnswer = 'A';

    selectAllQuestions();
  }

  void selectAllQuestions() async {
    questions = await DatabaseController.quizDatabase.selectAllQuestion();
    notifyListeners();
  }

  void deleteQuestion(int id) async {
    await DatabaseController.quizDatabase.deleteQuestion(id);
    selectAllQuestions();
  }
}
