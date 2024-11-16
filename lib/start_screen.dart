import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Opacity(
            opacity: 0.5,
            child: Image(
              image: AssetImage(
                'assets/images/quiz-logo.png',
              ),
              width: 300,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            'Learn flutter in the fun way!',
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          Opacity(
            opacity: 0.8,
            child: OutlinedButton.icon(
              onPressed: startQuiz,
              style:
                  OutlinedButton.styleFrom(backgroundColor: Colors.transparent),
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                'Take quiz',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
