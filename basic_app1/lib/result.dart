import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;
  Result(this.totalScore, this.resetQuiz);

  String get returnPhase {
    String resultString = '';
    if (totalScore <= 10) {
      resultString = "You are awesome and innocent";
    } else if (totalScore <= 14) {
      resultString = "You are a good human!";
    } else if (totalScore <= 18) {
      resultString = "you are ok or strange kind of person";
    } else {
      resultString = "you are done bro/sis!!";
    }

    return resultString;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Text(
            returnPhase,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetQuiz, child: const Text('Reset every thing!')),
        ],
      ),
    ));
  }
}
