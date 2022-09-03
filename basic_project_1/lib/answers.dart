import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback buttoncliked;
  final String answertext;
  AnswerButton(this.answertext, this.buttoncliked);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(
          answertext,
        ),
        onPressed: buttoncliked,
      ),
    );
  }
}
