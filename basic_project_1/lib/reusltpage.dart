import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  var _totalScore;
  final VoidCallback resetAll;
  ResultPage(this._totalScore, this.resetAll);

  String get resultText {
    String results = "";
    if (_totalScore == 0) {
      results = "hey fellow you did a Poor job! your score is zero :(";
    } else if (_totalScore == 10) {
      results = " need improvement fella! your score is 1 ";
    } else if (_totalScore == 20) {
      results = "not so bad but need improvemnt! your score is 2";
    } else if (_totalScore == 30) {
      results =
          "good you scored a 3! , study hard  so thst next time you would score a 4!";
    } else {
      results = "OMG! excellent you scored a 4 :)";
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.red,
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text(
            resultText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
            child: const Text(
              'reset the Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: resetAll)
      ],
    );
  }
}
