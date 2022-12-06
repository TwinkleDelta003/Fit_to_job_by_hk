import 'package:flutter/material.dart';

class QuestionHomeScreen extends StatefulWidget {
  final String questionText;

  const QuestionHomeScreen(this.questionText, {Key key}) : super(key: key);

  @override
  State<QuestionHomeScreen> createState() => _QuestionHomeScreenState();
}

class _QuestionHomeScreenState extends State<QuestionHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        widget.questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
