import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.items, {super.key});
  final Map<String, Object> items;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = items['user_answer'] == items['correct_index'];
    return Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 5,),
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: items["question_index"] as int,
        ),
        const SizedBox(
          width:10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                items['user_answer'] as String,
                style: TextStyle(color: Colors.purple.shade100),
              ),
              Text(
                items['correct_index'] as String,
                style: const TextStyle(color: Colors. black45),
              ),
            ],
          ),
        )
      ],
    );
  }
}
