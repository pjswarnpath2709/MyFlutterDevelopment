import 'package:flutter/material.dart';
import 'QuestionWidget.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int _questionIndex;
  final Function _answerQuestion;

  Quiz(
    @required this.questions,
    @required this._answerQuestion,
    @required this._questionIndex,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        QuestionWidegt(
          questionText: questions[_questionIndex]['questionText'] as String,
        ),
        ...(questions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => _answerQuestion(answer['score'] as int),
            answer['text'] as String,
          );
        }).toList(),
        // ... is the spreader operator and this will spread and add items to the
        //surrounding list
      ],
    ));
  }
}
