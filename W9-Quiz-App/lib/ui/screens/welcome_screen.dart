import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onStart;

  const StartScreen({
    super.key,
    required this.quiz,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
        ),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'quiz-logo.png',
              width: 200,
              height: 250,
              fit: BoxFit.contain,
            ),
            Text(quiz.title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            AppButton(label: "Start", onPressed: onStart),
          ],
        ),
      ),
    );
  }
}
