import 'package:flutter/material.dart';
import 'package:quizzler/main.dart';
import 'package:quizzler/quizpage.dart';

class friends extends StatefulWidget {
  const friends({key}) : super(key: key);
  @override
  State<friends> createState() => _friendsState();
}

class _friendsState extends State<friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}
