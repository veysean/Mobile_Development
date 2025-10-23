import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        point: q['points'],
      );
    }).toList();

    return Quiz(questions: questions);
  }

  void writeQuiz(Quiz quiz) {
    final questionsJson = quiz.questions.map((q) => q.toJson()).toList();
    final data = {'questions': questionsJson};

    final file = File(filePath);
    file.writeAsStringSync(JsonEncoder.withIndent('  ').convert(data), flush: true);
  }
}
