
import 'package:flutter/material.dart';
import '../../model/question.dart';
import 'choice_tile.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int? selectedIndex;
  final ValueChanged<int> onSelect;

  const QuestionCard({
    super.key,
    required this.question,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question.text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            ...List.generate(question.choices.length, (i) {
              final choice = question.choices[i];
              return ChoiceTile(
                label: choice.label,
                selected: selectedIndex == i,
                onTap: () => onSelect(i),
              );
            }),
          ],
        ),
      ),
    );
  }
}