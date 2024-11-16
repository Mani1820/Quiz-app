import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  void chosenAnswer(String answers) {
    selectedAnswer.add(answers);
    if (selectedAnswer.length == questions.length) {
      setState(
        () {
          activeScreen = ResultScreen(
            choosedAnswers: selectedAnswer,
            onRestart: restartQuiz,
          );
        },
      );
    }
  }

  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = QuestionsScreen(
          onSelected: chosenAnswer,
        );
      },
    );
  }

  void restartQuiz() {
      setState(() {
        selectedAnswer = [];
        activeScreen =
          QuestionsScreen(onSelected: chosenAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
