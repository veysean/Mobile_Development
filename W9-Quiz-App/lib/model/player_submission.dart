import 'quiz.dart';

class PlayerSubmission {
  final String quizId;
  final List<int> selectedIndices;

  PlayerSubmission({required this.quizId, List<int>? selectedIndices})
      : selectedIndices = selectedIndices ?? [];

  void setAnswer(int questionIndex, int selectedIndex) {
    if (questionIndex < selectedIndices.length) {
      selectedIndices[questionIndex] = selectedIndex;
    } else {
      while (selectedIndices.length < questionIndex) {
        selectedIndices.add(-1);
      }
      selectedIndices.add(selectedIndex);
    }
  }

  int score(Quiz quiz) {
    int s = 0;
    for (int i = 0; i < quiz.questions.length; i++) {
      final q = quiz.questions[i];
      if (i < selectedIndices.length && selectedIndices[i] == q.correctIndex) {
        s++;
      }
    }
    return s;
  }
}
