import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // const Answer({Key? key}) : super(key: key);

  final VoidCallback selectHandler;
  final String answerText;
  // final Function selectHandler;
/*
HERE WE ARE using VoidCallBack because function does not support void returns 
https://stackoverflow.com/questions/70224169/lib-answer-dart1620-error-the-argument-type-function-cant-be-assigned-to
*/

  // final String buttonText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
