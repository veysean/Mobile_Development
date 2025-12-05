import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/player_submission.dart';
import '../widgets/app_button.dart';
import '../widgets/question_card.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final int questionIndex;
  final PlayerSubmission submission;
  final VoidCallback onNext;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.questionIndex,
    required this.submission,
    required this.onNext,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? tempSelected;

  @override
  void initState() {
    super.initState();
    if (widget.questionIndex < widget.submission.selectedIndices.length) {
      final prev = widget.submission.selectedIndices[widget.questionIndex];
      if (prev >= 0) tempSelected = prev;
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[widget.questionIndex];

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Question ${widget.questionIndex + 1}/${widget.quiz.length}"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          QuestionCard(
            question: question,
            selectedIndex: tempSelected,
            onSelect: (i) {
              setState(() {
                tempSelected = i;
              });
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: widget.questionIndex == widget.quiz.length - 1
                        ? "Finish"
                        : "Next",
                    onPressed: () {
                      if (tempSelected == null) return;
                      widget.submission
                          .setAnswer(widget.questionIndex, tempSelected!);
                      widget.onNext();
                    },
                    enabled: tempSelected != null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
