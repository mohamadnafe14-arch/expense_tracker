import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/tranaction_card.dart';
import 'package:flutter/material.dart';

class TranacionList extends StatelessWidget {
  const TranacionList({super.key, required this.expenses});
  final List<ExpenseModel> expenses;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliverList.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TranactionCard(expense: expenses[index]),
        ),
      ),
    );
  }
}
