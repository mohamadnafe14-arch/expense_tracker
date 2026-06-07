import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:flutter/material.dart';

class TranactionCard extends StatelessWidget {
  final ExpenseModel expense;

  const TranactionCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final isIncome = expense.transactionType == 'Deposit';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: expense.categories.isNotEmpty
                ? expense.categories.first.color.withValues(alpha: 0.2)
                : Colors.grey.shade200,
            child: expense.categories.isNotEmpty
                ? Icon(
                    expense.categories.first.icon,
                    color: expense.categories.first.color,
                  )
                : const Icon(Icons.category),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: expense.categories.map((category) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(category.icon, size: 14, color: category.color),
                          const SizedBox(width: 4),
                          Text(
                            category.name,
                            style: TextStyle(
                              color: category.color,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            '${isIncome ? '+' : '-'}\$${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isIncome ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
