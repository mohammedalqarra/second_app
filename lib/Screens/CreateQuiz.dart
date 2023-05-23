import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/DataBase/databaseController.dart';
import 'package:second_app/Provider/databaseProvider.dart';
import 'package:second_app/Models/databaseModel.dart';
import 'package:second_app/QuestionWidget.dart';
import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/Screens/homepage.dart';
import '../app_routes.dart';
import '../StartQuizWidget.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DatabaseProvider>(context, listen: false).selectAllQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create Quiz',
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: databaseProvider.questions.isEmpty
            ? Center(
                child: Column(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10),
                            minimumSize: Size(600, 50),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: () {
                          AppRouter.pushWidget(AddNewQuestion());
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child:
                              Icon(Icons.add, size: 16, color: Colors.white),
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
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'lib/assets/faq.png',
                      width: 250,
                      height: 250,
                    ),
                    const Text(
                      'You must add at least 5 question to start',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            //  navigateToHomePage();
                            AppRouter.pushWidget(HomePage());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Back to Home!",
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
            : Column(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10),
                       minimumSize: Size(600, 50),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        AppRouter.pushWidget(AddNewQuestion());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child:
                                Icon(Icons.add, size: 16, color: Colors.white),
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
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 393,
                    height: 679,
                    child: Scrollbar(
                      radius: Radius.circular(12),
                      thickness: 6,
                      thumbVisibility: true,
                      controller: scrollController,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: databaseProvider.questions.length,
                        itemBuilder: (context, int index) {
                          return QuestionWidget(
                            dataBaseModel: databaseProvider.questions[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}

//  body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Stack(
//                   children: [
//                     Row(
//                       children: [
//                         const Expanded(
//                           child: Text(
//                             'What is Flutter ?',
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                             maxLines: null,
//                             overflow: TextOverflow.clip,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return Dialog(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   child: Container(
//                                     width: 400, // Set the width of the dialog
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.stretch,
//                                       children: [
//                                         const Padding(
//                                           padding: EdgeInsets.all(16.0),
//                                           child: Text(
//                                             "Delete question",
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                         const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 16.0),
//                                           child: Text(
//                                             "Are you sure you want to delete this question?",
//                                             style: TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                         ButtonBar(
//                                           children: [
//                                             TextButton(
//                                               child: const Text(
//                                                 "Cancel",
//                                                 style: TextStyle(
//                                                   color: Colors.teal,
//                                                 ),
//                                               ),
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .pop(); // Close the dialog
//                                               },
//                                             ),
//                                             TextButton(
//                                               child: const Text(
//                                                 "Delete",
//                                                 style: TextStyle(
//                                                   color: Colors.teal,
//                                                 ),
//                                               ),
//                                               onPressed: () {
//                                                 // Perform the delete operation here
//                                                 Navigator.of(context)
//                                                     .pop(); // Close the dialog
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                           icon: const Icon(
//                             Icons.delete,
//                             color: Color.fromARGB(255, 162, 161, 161),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             child: Text(
//                               "A mobile development framework",
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.teal,
//                                 fixedSize: Size(0, 40),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                             vertical: 50,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "A mobile development framework",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   fixedSize: Size(0, 40),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                             ),
//                             padding: EdgeInsets.only(top: 100)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "A mobile development framework",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   fixedSize: Size(0, 40),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                             ),
//                             padding: EdgeInsets.only(top: 150)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "A mobile development framework",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   fixedSize: Size(0, 40),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                             ),
//                             padding: EdgeInsets.only(top: 200)),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
