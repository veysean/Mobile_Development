import '../../model/quiz.dart';
import '../../model/question.dart';
import '../../model/choice.dart';

class QuizMockRepository {
  Quiz loadQuiz() {
    return Quiz(
      id: "quiz-001",
      title: "General Knowledge",
      questions: [
        Question(
          id: "q1",
          text: "Which planet is known as the Red Planet?",
          choices: const [
            Choice(id: "c11", label: "Earth"),
            Choice(id: "c12", label: "Mars"),
            Choice(id: "c13", label: "Jupiter"),
            Choice(id: "c14", label: "Venus"),
          ],
          correctIndex: 1,
        ),
        Question(
          id: "q2",
          text: "What is the capital of Japan?",
          choices: const [
            Choice(id: "c21", label: "Seoul"),
            Choice(id: "c22", label: "Tokyo"),
            Choice(id: "c23", label: "Kyoto"),
            Choice(id: "c24", label: "Osaka"),
          ],
          correctIndex: 1,
        ),
        Question(
          id: "q3",
          text: "How many continents are there?",
          choices: const [
            Choice(id: "c31", label: "5"),
            Choice(id: "c32", label: "6"),
            Choice(id: "c33", label: "7"),
            Choice(id: "c34", label: "8"),
          ],
          correctIndex: 2,
        ),
      ],
    );
  }
}
