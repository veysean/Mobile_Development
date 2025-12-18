import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'categoryCard.dart';

class ExpensesStatistics extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesStatistics({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Category.values.map((category) {
          return CategoryCard(
            expenses: expenses,
            category: category,
          );
        }).toList(),
      ),
    );
  }
}
