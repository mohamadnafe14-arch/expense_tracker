import 'package:expense_tracker/core/utils/dependecy_injection.dart';
import 'package:expense_tracker/features/add_expense/data/repos/add_expense_repo.dart';
import 'package:expense_tracker/features/add_expense/presentation/viewmodel/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/features/add_expense/presentation/views/widgets/add_expenses_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseView extends StatelessWidget {
  const AddExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddExpenseCubit(addExpenseRepo: getIt<AddExpenseRepo>()),
      child: const Scaffold(body: AddExpensesBody()),
    );
  }
}
