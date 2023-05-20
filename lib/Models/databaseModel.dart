import 'package:second_app/DataBase/databaseController.dart';

class DataBaseModel {
  int? id;
  late String titleQuestion;
  late String firstAnswer;
  late String secondAnswer;
  late String thirdAnswer;
  late String fourthAnswer;
  late String correctAnswer;

  DataBaseModel({
    required this.titleQuestion,
    required this.firstAnswer,
    required this.secondAnswer,
    required this.thirdAnswer,
    required this.fourthAnswer,
    required this.correctAnswer,
  });
// The from Map constructor allows creating a DataBase Model instance from a Map<String, dynamic>.
// It retrieves the values from the map using the column names provided by the DatabaseController class.
  DataBaseModel.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseController.questionId];
    titleQuestion = map[DatabaseController.titleQuestion];
    firstAnswer = map[DatabaseController.firstAnswer];
    secondAnswer = map[DatabaseController.secondAnswer];
    thirdAnswer = map[DatabaseController.thirdAnswer];
    fourthAnswer = map[DatabaseController.fourthAnswer];
    correctAnswer = map[DatabaseController.correctAnswer];
  }

  // DataBase Model instance into a Map<String, dynamic>.
  Map<String, dynamic> toMap() {
    return {
      DatabaseController.questionId: id,
      DatabaseController.titleQuestion: titleQuestion,
      DatabaseController.firstAnswer: firstAnswer,
      DatabaseController.secondAnswer: secondAnswer,
      DatabaseController.thirdAnswer: thirdAnswer,
      DatabaseController.fourthAnswer: fourthAnswer,
      DatabaseController.correctAnswer: correctAnswer,
    };
  }
}
