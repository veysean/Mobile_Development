
import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/player_submission.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final PlayerSubmission submission;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.submission,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final score = submission.score(quiz);

    return Scaffold(
      appBar: AppBar(title: const Text("Results"),backgroundColor: Colors.lightBlue),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Your score: $score / ${quiz.length}",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          ...List.generate(quiz.length, (i) {
            final q = quiz.questions[i];
            final sel = (i < submission.selectedIndices.length)
                ? submission.selectedIndices[i]
                : -1;
            final isCorrect = sel == q.correctIndex;

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${i + 1}. ${q.text}",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      "Your answer: ${sel >= 0 ? q.choices[sel].label : "Not answered"}",
                      style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.red),
                    ),
                    Text("Correct answer: ${q.choices[q.correctIndex].label}",
                        style: const TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          AppButton(label: "Restart", onPressed: onRestart),
        ],
      ),
    );
  }
}
