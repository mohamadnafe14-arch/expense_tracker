import 'package:bloc/bloc.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:expense_tracker/features/add_expense/data/repos/add_expense_repo.dart';
import 'package:flutter/foundation.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  final AddExpenseRepo addExpenseRepo;
  AddExpenseCubit({required this.addExpenseRepo}) : super(AddExpenseInitial());

  Future<void> addExpense(ExpenseModel expense) async {
    emit(AddExpenseLoading());
    final result = await addExpenseRepo.addExpense(expense: expense);
    result.fold(
      (l) => emit(AddExpenseFailure(message: l.message)),
      (r) => emit(AddExpenseSuccess()),
    );
  }
}
