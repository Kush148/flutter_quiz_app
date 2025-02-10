import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const int correctAnswer = 10;
  static const int incorrectAnswer = -5;
  var _questionIndex = 0;
  var _totalScore = 0;
  late final int _maxScore = _questions.length * 10;

  final _questions = [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': incorrectAnswer},
        {'text': 'Adobe', 'score': incorrectAnswer},
        {'text': 'Google', 'score': correctAnswer},
        {'text': 'Microsoft', 'score': incorrectAnswer},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': incorrectAnswer},
        {'text': 'IOS Development Kit', 'score': incorrectAnswer},
        {'text': 'Web Development Kit', 'score': incorrectAnswer},
        {
          'text': 'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': correctAnswer,
        },
      ],
    },
    {
      'questionText': 'Q3. Which programming language is used by Flutter?',
      'answers': [
        {'text': 'Ruby', 'score': incorrectAnswer},
        {'text': 'Dart', 'score': correctAnswer},
        {'text': 'C++', 'score': incorrectAnswer},
        {'text': 'Kotlin', 'score': incorrectAnswer},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programming language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': correctAnswer},
        {'text': 'Brendan Eich', 'score': incorrectAnswer},
        {'text': 'Bjarne Stroustrup', 'score': incorrectAnswer},
        {'text': 'Jeremy Ashkenas', 'score': incorrectAnswer},
      ],
    },
    {
      'questionText': 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {'text': 'Yes', 'score': correctAnswer},
        {'text': 'No', 'score': incorrectAnswer},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
    _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);

    setState(() {
     _questionIndex = _questionIndex + 1;
    });
    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizzy'),
          backgroundColor: const Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz, _maxScore),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
