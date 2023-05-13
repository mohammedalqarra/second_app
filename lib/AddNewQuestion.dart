import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddNewQuestion extends StatefulWidget {
  const AddNewQuestion({super.key});

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextField(
                maxLines: null,
                autofocus: true,
                focusNode: focusNode,
                decoration: InputDecoration(
                  labelText: "Question",
                  //   fillColor: Colors.red,
                  border: OutlineInputBorder(
                    //  borderSide:
                    //    const BorderSide(color: Colors.teal, width: 3.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 20,
                      child: Text(
                        "A",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: "First Answer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 20,
                      child: Text(
                        "B",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: "Second Answer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 109, 150, 221),
                      radius: 20,
                      child: Text(
                        "C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: "Third Answer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 20,
                      child: Text(
                        "D",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: "Fourth Answer",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.teal,
                ),
                onPressed: () => focusNode.requestFocus(),
                child: const Text('Add Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
