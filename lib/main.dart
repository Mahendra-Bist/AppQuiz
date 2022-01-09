import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp()); // runApp provided by flutter to initiate, takes widght tree
  //and shows it on screen
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //_ means private in dart
  var questionIndex = 0;
  var _totalScore = 0;
  final questions = const [
    {
      "questionText": "Who is the best cricketer in the world?",
      'answers': [
        {'text': 'Sachin Tendukar', 'score': 0},
        {'text': 'Virat Kohli', 'score': 0},
        {'text': 'Sandeep Lamichhane', 'score': 10},
      ],
    },
    {
      "questionText": "What is the Full form of RAM?",
      'answers': [
        {'text': 'Random Access Memory', 'score': 10},
        {'text': 'Ram Ate Memory', 'score': 0},
        {'text': 'Read Any Memory', 'score': 0},
      ]
    },
    {
      "questionText": "What's capital city of USA?",
      'answers': [
        {'text': 'London', 'score': 0},
        {'text': 'New York', 'score': 0},
        {'text': 'Tokyo', 'score': 0},
        {'text': 'Washington, D.C.', 'score': 10},
      ]
    }
  ];
  void answerQuestion(int score) {
    if (questionIndex < questions.length) {}
    _totalScore = _totalScore + score;
    print(_totalScore);
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //home is named arg

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: questionIndex < questions.length
            ? Quiz(answerQuestion, questions, questionIndex)
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
