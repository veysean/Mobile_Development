import 'package:flutter/material.dart';
import 'package:my_first_project/Expense/ui/expenses/expenses_statistic.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 20,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 16,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  Future<void> onAddClicked(BuildContext context) async {
    final newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );

    if (newExpense != null) {
      setState(() {
        _expenses.add(newExpense);
      });
    }
  }

  void _removeExpenseWithUndo(Expense expense, int index) {
    setState(() {
      _expenses.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted."),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _expenses.insert(index, expense);
            });
          },
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => {onAddClicked(context)},
              icon: Icon(Icons.add),
            ),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Expenses App'),
      ),
      body: Column(
        children: [
          ExpensesStatistics(expenses: _expenses),
          Expanded(
            child: _expenses.isEmpty
                ? const Center(
                    child: Text(
                      "No expenses found. Start adding some!",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) {
                      final expense = _expenses[index];
                      return Dismissible(
                        key: ValueKey(
                            expense.title + expense.date.toIso8601String()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) =>
                            _removeExpenseWithUndo(expense, index),
                        child: ExpenseItem(expense: expense),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
