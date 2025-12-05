import 'choice.dart';

class Question {
  final String id;
  final String text;
  final List<Choice> choices;
  final int correctIndex;

  const Question({
    required this.id,
    required this.text,
    required this.choices,
    required this.correctIndex,
  });
}
