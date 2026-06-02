import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/exceptions/generic_exceptions.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';

class FirestoreService {
  final FirebaseFirestore firebaseServices;

  FirestoreService(this.firebaseServices);
  Future<ExpenseModel> addExpense(ExpenseModel expense) async {
    try {
      await firebaseServices.collection('expenses').add(expense.toMap());
      final result = await firebaseServices
          .collection('expenses')
          .where('id', isEqualTo: expense.id)
          .get();
      return ExpenseModel.fromMap(result.docs.first.data());
    } on FirebaseException catch (e) {
      _handleFirestoreException(e);
    }
  }

  Future<List<ExpenseModel>> getExpenses() async {
    try {
      final result = await firebaseServices.collection('expenses').get();
      return result.docs
          .map((doc) => ExpenseModel.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      _handleFirestoreException(e);
    }
  }

  Never _handleFirestoreException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        throw const PermissionDeniedException(
          'Permission denied. Please check your Firestore rules.',
        );

      case 'unavailable':
        throw const UnavailableServiceException(
          'Firestore service is currently unavailable.',
        );

      case 'unauthenticated':
        throw const UnAuthenticatedException('User is not authenticated.');

      case 'not-found':
        throw const NotFoundException('Document not found.');

      default:
        throw FireStoreException(e.message ?? 'Unknown Firestore error');
    }
  }
}
