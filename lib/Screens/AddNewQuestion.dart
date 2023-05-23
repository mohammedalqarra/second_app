import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Screens/congratulations.dart';
import 'package:second_app/Screens/homepage.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Models/databaseModel.dart';
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

  // @override
  // void dispose() {
  //   focusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: () async {
    //     print('Back Button pressed');
    //     final shouldPop = await showWarning(context);
    //     return shouldPop ?? false;
    //   },
      return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text("Add new question"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Form(
                  key: databaseProvider.formState,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        width: 377,
                        child: TextFormField(
                        controller: databaseProvider.titleQuestion,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text titleQuestion';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        maxLines: null,
                        minLines: 1,
                        autofocus: true,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.question_mark,
                            color: Color.fromRGBO(82, 78, 78, 0.506),
                          ),
                          labelText: "Question",
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(82, 78, 78, 0.506),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.teal),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
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
                                      child: TextFormField(
                                        controller:
                                            databaseProvider.firstAnswer,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text firstAnswer';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          labelText: "First Answer",
                                          labelStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                82, 78, 78, 0.506),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.teal),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                      child: TextFormField(
                                        controller:
                                            databaseProvider.secondAnswer,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text secondAnswer';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          labelText: "Second Answer",
                                          // hintText: "Enter Second answer",
                                          labelStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                82, 78, 78, 0.506),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.teal,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        obscureText: true,
                                        keyboardType: TextInputType.datetime,
                                        //onChanged: (value) =>  name = value,
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
                                    backgroundColor:
                                        Color.fromARGB(255, 109, 150, 221),
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
                                      child: TextFormField(
                                        controller:
                                            databaseProvider.thirdAnswer,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text thirdAnswer';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          labelText: "Third Answer",
                                          labelStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                82, 78, 78, 0.506),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.teal,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                      child: TextFormField(
                                        controller:
                                            databaseProvider.fourthAnswer,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text fourthAnswer';
                                          }
                                          return null;
                                        },
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          labelText: "Fourth Answer",
                                          labelStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                82, 78, 78, 0.506),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.teal,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 230,
                              child: const Text(
                                "Select the correct answer",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: DropdownButton<String>(
                                elevation: 50,
                                iconSize: 20,
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                items: items.map((String value) {
                                  Color itemColor = Colors
                                      .teal; // Specify your desired color here
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: itemColor),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? correctAnswer) {
                                  setState(() {
                                    databaseProvider.correctAnswer =
                                        correctAnswer!;
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
                          if (databaseProvider.formState.currentState!
                              .validate()) {
                            databaseProvider.insertNewQuestion();
                          }
                        },
                        child: const Text(
                          'Add question',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
     // ),
    );
  }
}
