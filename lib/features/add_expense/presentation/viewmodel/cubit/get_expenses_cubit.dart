import 'package:bloc/bloc.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:expense_tracker/features/add_expense/data/repos/add_expense_repo.dart';
import 'package:flutter/foundation.dart';

part 'get_expenses_state.dart';

class GetExpensesCubit extends Cubit<GetExpensesState> {
  final AddExpenseRepo addExpenseRepo;
  GetExpensesCubit({required this.addExpenseRepo})
    : super(GetExpensesInitial());

  Future<void> getExpenses() async {
    emit(GetExpensesLoading());
    final result = await addExpenseRepo.getExpenses();
    result.fold(
      (l) => emit(GetExpensesFailure(message: l.message)),
      (r) => emit(GetExpensesSuccess(expenses: r)),
    );
  }
}
