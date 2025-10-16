class Answer {
  String answerChoice;

  Answer({required this.answerChoice});

  bool isGoodAsnwer(Question question) {
    return answerChoice == question.goodChoice;
  }
}

class Question {
  String title;
  List<String> choices;
  String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  });
}

class Quiz {
  List<Question> questions = [];
  List<Answer> answers = [];

  void addQuestion(Question question) {
    questions.add(question);
  }

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0;
    for (int i = 0; i < answers.length && i < questions.length; i++) {
      if (answers[i].isGoodAsnwer(questions[i])) {
        score++;
      }
    }
    return score;
  }
}

void main() {


  Question q1 = Question(
    title: "What is the capital of Cambodia?",
    choices: ["Phnom Penh", "Siem Reap", "Battambang"],
    goodChoice: "Phnom Penh",
  );

  Question q2 = Question(
    title: "Which language is used for Flutter development?",
    choices: ["Java", "Dart", "Python"],
    goodChoice: "Dart",
  );

  Answer a1 = Answer(answerChoice: "Phnom Penh"); 
  Answer a2 = Answer(answerChoice: "Dart");     

  Quiz quiz = Quiz();
  quiz.addQuestion(q1);
  quiz.addQuestion(q2);
  quiz.addAnswer(a1);
  quiz.addAnswer(a2);

  print("Your score is: ${quiz.getScore()} out of ${quiz.questions.length}");
}
