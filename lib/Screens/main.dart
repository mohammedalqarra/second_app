import 'package:second_app/Screens/AddNewQuestion.dart';
import 'package:second_app/Screens/CreateQuiz.dart';
import 'package:second_app/Screens/NotQuestion.dart';
import 'package:flutter/material.dart';
//import 'package:second_app/ResultQuiz.dart';

import 'NotQuestion.dart';

void main() {
  runApp(MyApp());
  // runApp(MaterialApp(
  //   title: 'Quzi App',
  //   theme: ThemeData(
  //     primarySwatch: Colors.green,
  //   ),

  //   initialRoute:'/',

  //   routes:{
  //     '/': (context) => Startquiz(),

  // //    '/seccond': (context) => ResultQuiz(),
  //   },
  // ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: ResultScreen(score: null),
      home: NotQuestion(),
    );
  }
}


// class ResultScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz App'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             int quizScore = 80;
//              Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResultScreen(score: quizScore),
//               ),
//             );
//         },
//         child: Text('Start Quiz'),
//         ),
//       ),
//     );
//   }
// }