import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddNewQuestion extends StatefulWidget {
  const AddNewQuestion({super.key});

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  var selectedItem = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Add new question"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        centerTitle: true,
      ),
    );
  }
}
