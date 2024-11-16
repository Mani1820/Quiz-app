import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelected});

  final void Function(String answers) onSelected;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestion = 0;
  void nextQuestion(String selectedAnswer) {
    widget.onSelected(selectedAnswer);
    setState(
      () {
        currentQuestion += 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentQuestion];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.getShuffledAnswer().map(
              (answers) {
                return AnswerButton(
                  answerText: answers,
                  onTap: () {
                    nextQuestion(answers);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
