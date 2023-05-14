import 'package:second_app/ResultScreen.dart';
import 'package:flutter/material.dart';
//import 'package:second_app/ResultQuiz.dart';

import 'ResultScreen.dart';

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
    // home: ResultQuiz(score: null),
     home:ResultScreen(),
    );
  }
}
