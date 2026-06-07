import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepo {
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
  getExpenses();
}
