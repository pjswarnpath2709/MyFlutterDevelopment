import 'dart:ui';

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final int questionNumber;

  Question({this.questionText = 'this is Question', this.questionNumber = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      //here i set the width of the container as infinity
      width: double.infinity,
      //here i set the Aligment  of the container as center
      alignment: Alignment.center,
      //here i set the padding inside the container
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(30.0),
      child: Row(

          //here I gave the alignment ot the Row using mainAxisAlignment
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                'Q' + questionNumber.toString() + ').',
                //here i gave some styling to the text
                style: const TextStyle(
                  //font size is direct double value
                  fontSize: 18,
                  //font weight decides the boldness of the text
                  fontWeight: FontWeight.bold,
                  //so from here i set up the color of the text
                  color: Colors.white,
                ),
                textAlign: TextAlign.end,
                textDirection: TextDirection.ltr,
              ),
            ),
            Expanded(
              child: Text(
                questionText,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.white,
                ),
                //here i aligned the text to the center
                textAlign: TextAlign.center,
              ),
            ),
          ]),
    );
  }
}
