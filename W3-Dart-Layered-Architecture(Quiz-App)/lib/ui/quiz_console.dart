import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while (true) {
      stdout.write('Your name: ');
      String? playerName = stdin.readLineSync();

      if (playerName == null || playerName.isEmpty) {
        print('\n--- Quiz Finished ---');
        break;
      }

      List<Answer> answers = [];

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.point} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          answers.add(Answer(questionId: question.id, answerChoice: userInput));
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      quiz.playerAnswers(playerName, answers);

      var player = quiz.getPlayer(playerName)!;
      int score = player.getScoreInPercentage(quiz);
      int scoreInPoint = player.getScoreInPoint(quiz);

      print('$playerName, your score in percentage: $score %');
      print('$playerName, your score in points: $scoreInPoint\n');

      print('--- All Player Scores ---');
      for (var p in quiz.getAllPlayers()) {
        print('Player: ${p.playerName}, Score: ${p.getScoreInPoint(quiz)}');
      }

      print('');
    }
  }
}
