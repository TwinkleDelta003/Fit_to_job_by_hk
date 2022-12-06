import 'package:fit_to_job/Quiz/answer.dart';
import 'package:fit_to_job/Quiz/question.dart';
import 'package:flutter/material.dart';

class QuizHomeScreen extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const QuizHomeScreen({
    Key key,
    this.questions,
    this.answerQuestion,
    this.questionIndex,
  }) : super(key: key);

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionHomeScreen(
          widget.questions[widget.questionIndex]['questionText'].toString(),
        ), //Question
        ...(widget.questions[widget.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => widget.answerQuestion(answer['score']),
              answer['text'].toString());
        }).toList()
      ],
    ); //Column
  }
}
