import 'package:basic_project_1/quizpage.dart';
import 'package:basic_project_1/reusltpage.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//Here we deifne a second link to convert a Stateless widget to Stateful widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//now so when ever we want to change the state of the widget we will call a
//setState() method in that function

//now i will convert the stateless widget  to state full widget using
// a class which is extended to state method
//lets start the process

//this class will extends the state of MyApp which is a stateful widget , this is the link one
class _MyAppState extends State<MyApp> {
//yaha par saare varibales dalunga taki woh har baar create na ho
  final _questions = <Map<String, Object>>[
    {
      'qtext': 'what is capital of India',
      'answers': <Map<String, Object>>[
        {'atext': 'New Delhi', 'score': 10},
        {'atext': 'Mumbai', 'score': 0},
        {'atext': 'Patna', 'score': 0},
        {'atext': 'Jaipur', 'score': 0},
      ]
    },
    {
      'qtext': 'what are colors in National Flag of India',
      'answers': <Map<String, Object>>[
        {'atext': 'Blue,Green,Grey', 'score': 0},
        {'atext': 'Red,yellow,Safron', 'score': 0},
        {'atext': 'Saffron,White,Green', 'score': 10},
        {'atext': 'None of the above ', 'score': 0},
      ]
    },
    {
      'qtext': 'what is the National Animal of India',
      'answers': <Map<String, Object>>[
        {'atext': 'Jackal', 'score': 0},
        {'atext': 'Rakoon', 'score': 0},
        {'atext': 'Hippopotamus', 'score': 0},
        {'atext': 'Tiger ', 'score': 10},
      ]
    },
    {
      'qtext': 'what is the National Bird of India',
      'answers': <Map<String, Object>>[
        {'atext': 'Eagle', 'score': 0},
        {'atext': 'Peacock', 'score': 10},
        {'atext': 'Sparrow', 'score': 0},
        {'atext': 'Kokoo', 'score': 0},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void answeredQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void resetgame() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Basic Quiz App'),
        ),

        //ab jo bhi kaam karenge apan body mein karenge , man lo apan ko sara content Center
        //karna hai to we will use the center widget
        //ab dikat yeh hai ki body mein ek hi container ayega so apan ko khudka ek custom conatiner
        //bhi define karna pad sakta hai
        body: _questionIndex < _questions.length
            ? QuizPage(
                _questions,
                _questionIndex,
                answeredQuestion,
              )
            : (ResultPage(_totalScore, resetgame)),
      ),
    );
  }
}
