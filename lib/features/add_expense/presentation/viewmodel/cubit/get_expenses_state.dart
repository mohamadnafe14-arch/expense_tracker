part of 'get_expenses_cubit.dart';

@immutable
sealed class GetExpensesState {}

final class GetExpensesInitial extends GetExpensesState {}

final class GetExpensesLoading extends GetExpensesState {}

final class GetExpensesSuccess extends GetExpensesState {
  final List<ExpenseModel> expenses;
  GetExpensesSuccess({required this.expenses});
}

final class GetExpensesFailure extends GetExpensesState {
  final String message;
  GetExpensesFailure({required this.message});
}
