 

import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quizRepository.dart';

void main() {
  QuizRepository repo = QuizRepository('D:/Y3/Develop/Molibe/Lab/Mobile_Development/W3-Dart-Layered-Architecture(Quiz-App)/lib/data/quiz.json');
  Quiz quiz = repo.readQuiz();
  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();
}

