import 'package:flutter/material.dart';

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
  int _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = <String>[
      "what's your favourite color",
      "what's your favourite animal",
      "what's your favourite fruit",
      "what's your favorite car",
    ]; //list of the  data

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[_questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () =>
                  print('Answer 2 is choosen using lemda expression'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                print('answer 3 is choosen');
                print('this is done by using anonymous function');
              },
            ),
            RaisedButton(
              child: Text('Answer 4'),
              onPressed: () {
                print('Answer 4 is choosen in the same way');
              },
            ),
          ],
        ),
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
