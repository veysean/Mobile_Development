import 'package:flutter/material.dart';

// Data & models
import '../data/quiz_mock_repository.dart';
import '../model/quiz.dart';
import '../model/player_submission.dart';

// Screens
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

enum AppStage { start, question, result }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final repo = QuizMockRepository();

  late Quiz quiz;
  late PlayerSubmission submission;

  AppStage stage = AppStage.start;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    quiz = repo.loadQuiz();

    submission = PlayerSubmission(quizId: quiz.id);
  }

  void startQuiz() {
    setState(() {
      submission = PlayerSubmission(quizId: quiz.id);
      currentIndex = 0;
      stage = AppStage.question;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentIndex < quiz.length - 1) {
        currentIndex++;
      } else {
        stage = AppStage.result;
      }
    });
  }

  void restart() {
    setState(() {
      stage = AppStage.start;
      submission = PlayerSubmission(quizId: quiz.id);
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (stage) {
      case AppStage.start:
        screen = StartScreen(quiz: quiz, onStart: startQuiz);
        break;

      case AppStage.question:
        screen = QuestionScreen(
          quiz: quiz,
          questionIndex: currentIndex,
          submission: submission,
          onNext: nextQuestion,
        );
        break;

      case AppStage.result:
        screen = ResultScreen(
          quiz: quiz,
          submission: submission,
          onRestart: restart,
        );
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: screen,
    );
  }
}
