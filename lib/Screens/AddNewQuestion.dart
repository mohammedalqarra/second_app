import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Provider/databaseProvider.dart';

class AddNewQuestion extends StatefulWidget {
  //const AddNewQuestion({super.key});
  const AddNewQuestion({Key? key}) : super(key: key);

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to exit the app?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Yes'),
            ),
          ],
        ),
      );

  FocusNode focusNode = FocusNode();
  bool hasFocus = false;

  List<String> items = <String>['A', 'B', 'C', 'D'];
  String correctAnswer = 'A';

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      print('Back Button pressed');
      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    }, child:
        Consumer<DatabaseProvider>(builder: (context, databaseProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Add new question"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            key: databaseProvider.formState,
            child: Form(
              key: databaseProvider.formState,
              child: Column(
                children: [
                  TextFormField(
                    controller: databaseProvider.titleQuestion,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text titleQuestion';
                      }
                      return null;
                    },
                    autofocus: true,
                    focusNode: focusNode,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.teal, width: 2)),
                      prefixIcon: Icon(
                        Icons.question_mark,
                        color: Colors.blueGrey,
                      ),
                      labelText: 'Question',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 11),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 25,
                          child: Center(
                            child: Text(
                              "A",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              controller: databaseProvider.firstAnswer,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text firstAnswer';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                labelText: 'First Answer',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 11),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 25,
                          child: Center(
                            child: Text(
                              "B",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              controller: databaseProvider.secondAnswer,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text firstAnswer';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                labelText: 'Second Answer',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 11),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 25,
                          child: Center(
                            child: Text(
                              "C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              controller: databaseProvider.thirdAnswer,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text firstAnswer';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                labelText: 'Third Answer',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 11),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 25,
                          child: Center(
                            child: Text(
                              "D",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              controller: databaseProvider.fourthAnswer,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text firstAnswer';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                labelText: 'Fourth Answer',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      //   mainAxisAlignment: Main,
                      children: [
                        const Text(
                          "Select The Correct Answer",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButton(
                            style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            items: [
                              "A",
                              "B",
                              "C",
                              "D",
                            ].map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Colors.teal, // Set color to teal
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                correctAnswer = value!;
                              });
                            },
                            value: correctAnswer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      textStyle: const TextStyle(fontSize: 15),
                      backgroundColor: Colors.teal,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      //  navigateToAddNewQuestion();
                      if (databaseProvider.formState.currentState!.validate()) {
                        databaseProvider.insertNewQuestion();
                      }
                    },
                    child: const Text(
                      'Add question',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
