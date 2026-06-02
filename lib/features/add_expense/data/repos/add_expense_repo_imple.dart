import 'package:expense_tracker/core/errors/failure.dart';
import 'package:expense_tracker/core/errors/firebase_failure.dart';
import 'package:expense_tracker/core/exceptions/generic_exceptions.dart';
import 'package:expense_tracker/core/services/firestore_service.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:expense_tracker/features/add_expense/data/repos/add_expense_repo.dart';
import 'package:fpdart/fpdart.dart';

class AddExpenseRepoImple implements AddExpenseRepo {
  final FirestoreService firestoreServices;

  AddExpenseRepoImple({required this.firestoreServices});
  @override
  Future<Either<Failure, ExpenseModel>> addExpense({
    required ExpenseModel expense,
  }) async {
    try {
      final result = await firestoreServices.addExpense(expense);
      return Right(result);
    } catch (e) {
      if (e is FireStoreException) {
        return Left(FirebaseFailure(e.message));
      } else {
        return Left(
          GenericFailure('An unexpected error occurred: ${e.toString()}'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<ExpenseModel>>> getExpenses() async {
    try {
      final result = await firestoreServices.getExpenses();
      return Right(result);
    } catch (e) {
      if (e is FireStoreException) {
        return Left(FirebaseFailure(e.message));
      } else {
        return Left(
          GenericFailure('An unexpected error occurred: ${e.toString()}'),
        );
      }
    }
  }
}
