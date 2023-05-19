import 'package:flutter/material.dart';
import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/HomePage.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();

  
}

class _CreateQuizState extends State<CreateQuiz> {
  void navigateToCreateQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
void navigateToAddNewQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewQuestion()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Quiz',
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            navigateToCreateQuiz();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    navigateToAddNewQuestion();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.add, size: 16, color: Colors.white),
                      ),
                      Text(
                        'Add new question',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: Size(600, 50),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'What is Flutter ?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            maxLines: null,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                          IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: 400, // Set the width of the dialog
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text(
                                            "Delete question",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            "Are you sure you want to delete this question?",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        ButtonBar(
                                          children: [
                                            TextButton(
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: Colors.teal,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                            ),
                                            TextButton(
                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: Colors.teal,
                                                ),
                                              ),
                                              onPressed: () {
                                                // Perform the delete operation here
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 162, 161, 161),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "A mobile development framework",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                fixedSize: Size(0, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 50,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "A mobile development framework",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(0, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            padding: EdgeInsets.only(top: 100)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "A mobile development framework",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(0, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            padding: EdgeInsets.only(top: 150)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "A mobile development framework",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(0, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            padding: EdgeInsets.only(top: 200)),
                      ],
                    )
                  ],
                ),
                
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        onPressed: () {
          navigateToAddNewQuestion();
        },
      ),
    );
  }
}
