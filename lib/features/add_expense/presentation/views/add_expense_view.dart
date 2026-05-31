import 'package:expense_tracker/features/add_expense/presentation/views/widgets/add_expenses_body.dart';
import 'package:flutter/material.dart';

class AddExpenseView extends StatelessWidget {
  const AddExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddExpensesBody());
  }
}
