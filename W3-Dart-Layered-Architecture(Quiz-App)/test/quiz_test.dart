import 'package:test/test.dart';
import 'package:my_first_project/domain/quiz.dart';
import 'package:my_first_project/data/quizRepository.dart';


void main() {
  // Create 2 questions and the quiz
  Question q1 = Question(
      title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", point: 10);

  Question q2 = Question(
      title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", point: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('All answers are correct (100%)', () {
    quiz.playerAnswers("Veysean", [
      Answer(questionId: q1.id, answerChoice: "4"),
      Answer(questionId: q2.id, answerChoice: "5"),
    ]);

    Player? veysean = quiz.getPlayer("Veysean");
    expect(veysean!.getScoreInPoint(quiz), equals(60));
    expect(veysean.getScoreInPercentage(quiz), equals(100));
  });

  test('Half answers are correct (16%)', () {
    quiz.playerAnswers("Me", [
      Answer(questionId: q1.id, answerChoice: "4"),
      Answer(questionId: q2.id, answerChoice: "2"),
    ]);

    Player? me = quiz.getPlayer("Me");
    expect(me!.getScoreInPoint(quiz), equals(10));
    expect(me.getScoreInPercentage(quiz), equals(16));
  });

  test('No answers are correct (0%)', () {
    quiz.playerAnswers("You", [
      Answer(questionId: q1.id, answerChoice: "1"),
      Answer(questionId: q2.id, answerChoice: "2"),
    ]);

    Player? you = quiz.getPlayer("You");
    expect(you!.getScoreInPoint(quiz), equals(0));
    expect(you.getScoreInPercentage(quiz), equals(0));
  });

  test('Quiz write and read JSON', () {
  Quiz quiz = Quiz(questions: [
    Question(
      title: "Test Q1",
      choices: ["A", "B", "C"],
      goodChoice: "B",
      point: 10,
    )
  ]);

  QuizRepository repo = QuizRepository('D:/Y3/Develop/Molibe/Lab/Mobile_Development/W3-Dart-Layered-Architecture(Quiz-App)/lib/data/saveQuiz.json');
  repo.writeQuiz(quiz);

  Quiz loaded = repo.readQuiz();
  expect(loaded.questions.length, equals(1));
  expect(loaded.questions[0].title, equals("Test Q1"));
});

}
