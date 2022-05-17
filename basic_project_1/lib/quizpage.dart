import 'package:flutter/material.dart';
import './question.dart';
import 'answers.dart';

class QuizPage extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final questionIndex;
  final Function buttonclicked;

  QuizPage(this.questions, this.questionIndex, this.buttonclicked);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        questionText: (questions[questionIndex]['qtext'] as String),
        questionNumber: questionIndex + 1,
      ),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return AnswerButton(answer['atext'] as String,
            () => buttonclicked(answer['score'] as int));
      }),
    ]);
  }
}
