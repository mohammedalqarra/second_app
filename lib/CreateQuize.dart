import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> answers;

  Question({required this.questionText, required this.answers});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Question> questions = [
    Question(questionText: 'Question 1', answers: ['Answer 1', 'Answer 2']),
    Question(questionText: 'Question 2', answers: ['Answer 1', 'Answer 2']),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Screen',
      home: CreateQuize(questions: questions),
    );
  }
}

class CreateQuize extends StatefulWidget {
  final List<Question> questions;

  const CreateQuize({required this.questions});

  @override
  _CreateQuizeState createState() => _CreateQuizeState();
}

class _CreateQuizeState extends State<CreateQuize> {
  void deleteQuestion(int index) {
    setState(() {
      widget.questions.removeAt(index);
    });
  }

  void navigateToAddQuestionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewQuestion()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Screen')),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.questions[index].questionText),
            trailing: GestureDetector(
              onTap: () => deleteQuestion(index),
              child: Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddQuestionScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddNewQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Question')),
      // Implement UI to add a new question here
    );
  }
}
