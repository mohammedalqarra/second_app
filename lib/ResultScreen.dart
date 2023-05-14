import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  ResultScreen({required this.score});
  @override
  _ResultScreenState createState() => _ResultScreenState();

}

class _ResultScreenState extends State<ResultScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
