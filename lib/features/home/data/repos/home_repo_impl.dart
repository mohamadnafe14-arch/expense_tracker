import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/core/errors/failure.dart';
import 'package:expense_tracker/core/errors/firebase_failure.dart';
import 'package:expense_tracker/core/exceptions/generic_exceptions.dart';
import 'package:expense_tracker/core/services/firestore_service.dart';
import 'package:expense_tracker/features/home/data/repos/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepoImpl implements HomeRepo {
  final FirestoreService firestoreService;

  HomeRepoImpl({required this.firestoreService});

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
  getExpenses() async {
    try {
      final result = await firestoreService.getExpenses();
      log(result.toString());
      return Right(result);
    } catch (e) {
      if (e is FireStoreException) {
        log(e.message);
        return Left(FirebaseFailure(e.message));
      } else {
        log(e.toString());
        return Left(
          GenericFailure('An unexpected error occurred: ${e.toString()}'),
        );
      }
    }
  }
}
