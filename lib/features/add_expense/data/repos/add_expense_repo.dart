import 'package:expense_tracker/core/errors/failure.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddExpenseRepo {
  Future<Either<Failure, ExpenseModel>> addExpense({
    required ExpenseModel expense,
  });

}
