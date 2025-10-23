import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    required this.point,
  }) : id = id ?? uuid.v4();

  int get points => this.point;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': point,
    };
  }
}

class Answer {
  final String questionId;
  final String answerChoice;

  Answer({required this.questionId, required this.answerChoice});

  bool isGood(Quiz quiz) {
    final question = quiz.getQuestionById(questionId);
    return question != null && answerChoice == question.goodChoice;
  }

  int getPoint(Quiz quiz) {
    final question = quiz.getQuestionById(questionId);
    return isGood(quiz) ? question?.point ?? 0 : 0;
  }
}

class Player {
  String playerName;
  List<Answer> answers = [];

  Player(this.playerName);

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScoreInPoint(Quiz quiz) {
    return answers.fold(0, (sum, a) => sum + a.getPoint(quiz));
  }

  int getScoreInPercentage(Quiz quiz) {
    final maxScore = quiz.getMaxScore();
    return maxScore == 0
        ? 0
        : ((getScoreInPoint(quiz) / maxScore) * 100).toInt();
  }
}

class Quiz {
  List<Question> questions;
  Map<String, Player> players = {};

  Quiz({required this.questions});

  int getMaxScore() {
    return questions.fold(0, (sum, q) => sum + q.point);
  }

  void playerAnswers(String playerName, List<Answer> answers) {
    Player player = players[playerName] ?? Player(playerName);
    player.answers.clear();
    for (var answer in answers) {
      player.addAnswer(answer);
    }
    players[playerName] = player;
  }

  Player? getPlayer(String name) => players[name];

  List<Player> getAllPlayers() => players.values.toList();

  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((q) => q.id == id);
    } catch (e) {
      return null;
    }
  }
}
