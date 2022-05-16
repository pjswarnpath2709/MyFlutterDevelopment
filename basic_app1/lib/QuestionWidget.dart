import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionWidegt extends StatelessWidget {
  final String questionText;

  QuestionWidegt({this.questionText = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
