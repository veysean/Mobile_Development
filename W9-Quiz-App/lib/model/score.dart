import 'quiz.dart';

class Score {
  final String quizId;
  final int correctCount;
  final int total;
  final List<bool> perQuestionCorrect;
  final DateTime finishedAt;

  Score({
    required this.quizId,
    required this.correctCount,
    required this.total,
    required this.perQuestionCorrect,
    required this.finishedAt,
  });

  double get percentage => total == 0 ? 0 : correctCount / total;

  Map<String, dynamic> toMap() => {
        'quizId': quizId,
        'correctCount': correctCount,
        'total': total,
        'perQuestionCorrect': perQuestionCorrect,
        'finishedAt': finishedAt.toUtc().toIso8601String(),
      };

  static Score fromMap(Map<String, dynamic> m) => Score(
        quizId: m['quizId'],
        correctCount: m['correctCount'],
        total: m['total'],
        perQuestionCorrect: List<bool>.from(m['perQuestionCorrect']),
        finishedAt: DateTime.parse(m['finishedAt']).toUtc(),
      );
}

Score computeScore(Quiz quiz, List<int?> selected) {
  final results = <bool>[];
  int correct = 0;
  for (var i = 0; i < quiz.questions.length; i++) {
    final sel = selected[i];
    final q = quiz.questions[i];
    final ok = (sel != null && sel == q.correctIndex);
    results.add(ok);
    if (ok) correct++;
  }
  return Score(
    quizId: quiz.id,
    correctCount: correct,
    total: quiz.questions.length,
    perQuestionCorrect: results,
    finishedAt: DateTime.now().toUtc(),
  );
}
