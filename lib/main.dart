import 'package:flutter/material.dart';
import 'interpage.dart';
import 'quizbrain.dart';

QuizBrain qb = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: interpage(),
    );
  }
}