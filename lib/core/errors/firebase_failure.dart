import 'package:expense_tracker/core/errors/failure.dart';

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);
  factory FirebaseFailure.fromException(Exception e) {
    // You can customize this factory constructor to handle different types of exceptions
    // and return appropriate error messages based on the exception type.
    return FirebaseFailure(e.toString());
  }
}
