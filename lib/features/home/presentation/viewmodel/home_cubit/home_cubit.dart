import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:expense_tracker/features/add_expense/data/models/expense_model.dart';
import 'package:expense_tracker/features/home/data/models/calculate_model.dart';
import 'package:expense_tracker/features/home/data/models/group_data_model.dart';
import 'package:expense_tracker/features/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  StreamSubscription? _subscription;

  String selectedCategory = 'All';

  List<ExpenseModel> _allExpenses = [];

  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  Future<void> loadHome() async {
    log('loadHome started');

    emit(HomeLoading());

    final result = await homeRepo.getExpenses();

    result.fold(
      (failure) {
        log('failure: ${failure.message}');
        emit(HomeError(failure.message));
      },
      (stream) {
        log('stream received');

        _subscription?.cancel();

        _subscription = stream.listen(
          (snapshot) {
            try {
              log('snapshot docs count = ${snapshot.docs.length}');

              final expenses = snapshot.docs
                  .map((doc) => ExpenseModel.fromMap(doc.data()))
                  .toList();

              log('expenses mapped = ${expenses.length}');

              if (expenses.isNotEmpty) {
                log(
                  'first expense categories = ${expenses.first.categories.length}',
                );
              }

              _allExpenses = expenses;

              log('_allExpenses assigned');

              _emitHomeLoaded();
            } catch (e, stackTrace) {
              log('LISTENER ERROR: $e', stackTrace: stackTrace);
            }
          },
          onError: (e, stackTrace) {
            log('STREAM ERROR: $e', stackTrace: stackTrace);
          },
        );
      },
    );
  }

  void changeCategory(String category) {
    selectedCategory = category;
    _emitHomeLoaded();
  }

  void _emitHomeLoaded() {
    try {
      log('_emitHomeLoaded started');

      final filteredExpenses = selectedCategory == 'All'
          ? _allExpenses
          : _allExpenses.where((expense) {
              return expense.categories.any(
                (cat) => cat.name == selectedCategory,
              );
            }).toList();

      log('filteredExpenses = ${filteredExpenses.length}');

      final categories = <CategoryModel>[];

      for (final expense in _allExpenses) {
        categories.addAll(expense.categories);
      }

      log('categories collected = ${categories.length}');

      final uniqueCategories = categories.toSet().toList();

      log('uniqueCategories = ${uniqueCategories.length}');

      double income = 0;
      double outcome = 0;

      for (final expense in filteredExpenses) {
        if (expense.transactionType == 'Deposit') {
          income += expense.amount;
        } else {
          outcome += expense.amount;
        }
      }

      log('income = $income');
      log('outcome = $outcome');

      final calculations = CalculateModel(
        income: income.toStringAsFixed(2),
        outcome: outcome.toStringAsFixed(2),
        balance: (income - outcome).toStringAsFixed(2),
      );

      final groupData = filteredExpenses.mapWithIndex((expense, index) {
        return GroupDataModel(x: index, y: expense.amount);
      }).toList();

      log('groupData = ${groupData.length}');

      emit(
        HomeLoaded(
          categories: uniqueCategories,
          expenses: filteredExpenses,
          calculations: calculations,
          groupData: groupData,
          selectedCategory: selectedCategory,
        ),
      );

      log('HomeLoaded emitted successfully');
    } catch (e, stackTrace) {
      log('_emitHomeLoaded ERROR: $e', stackTrace: stackTrace);
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
