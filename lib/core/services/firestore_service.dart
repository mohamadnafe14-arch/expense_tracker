import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/constants/firestore_constants.dart';
import 'package:expense_tracker/core/exceptions/generic_exceptions.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';

class FirestoreService {
  final FirebaseFirestore firebaseServices;

  FirestoreService(this.firebaseServices);
  Future<ExpenseModel> addExpense(ExpenseModel expense) async {
    try {
      await firebaseServices.collection(ref).add(expense.toMap());
      final result = await firebaseServices
          .collection(ref)
          .where('id', isEqualTo: expense.id)
          .get();
      return ExpenseModel.fromMap(result.docs.first.data());
    } on FirebaseException catch (e) {
      _handleFirestoreException(e);
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getExpenses() async {
    try {
      final result = firebaseServices.collection(ref).snapshots();
      return result;
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
