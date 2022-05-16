import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './QuestionWidget.dart';
import './answer.dart';
import './result.dart';
import './quiz.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());
//when there is only one expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); //adding underscire makes the class as private to this dart file
  }
}

//adding a inderscore against any member of the class makes it private to the class and the file
//this will be used as the conceot of oops
class _MyAppState extends State<MyApp> {
  final _questions = <Map<String, Object>>[
    {
      'questionText': "what's your favourite color",
      'answers': <Map<String, Object>>[
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'White',
          'score': 1,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'green',
          'score': 3,
        }
      ],
    },
    {
      'questionText': "what's your favourite animal",
      'answers': [
        {'text': 'Tiger', 'score': 1},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Girraf', 'score': 8},
        {'text': 'Monkey', 'score': 10},
      ],
    },
    {
      'questionText': "what's your favourite fruit",
      'answers': [
        {'text': 'Mango', 'score': 1},
        {'text': 'Orange', 'score': 10},
        {'text': 'Apple', 'score': 8},
        {'text': 'Guava', 'score': 4},
      ],
    },
    {
      'questionText': "what's your favourite Car",
      'answers': [
        {
          'text': 'Maruti',
          'score': 10,
        },
        {
          'text': 'Mustang',
          'score': 3,
        },
        {'text': 'Nisaan', 'score': 8},
        {
          'text': 'Ferrari',
          'score': 5,
        },
      ],
    }
  ]; //list of the  data

  int _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = (_questionIndex + 1);
    });
  }

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore, resetQuiz),
        //this body only takes one widget and whole the body is covered by
        //the widget we passed through it
      ), //named arguments were passed
    );
    //the Text() is also a widget
  }

  /*
   Scaffold has a job of creating a base 
   page design of our flutter app
   as all the things should have to be done by ourself
   hence we need a base design to start our work
   this is done be the scafflod
   */
}
