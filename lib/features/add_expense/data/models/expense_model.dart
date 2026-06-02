import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class ExpenseModel {
  final int id;
  final double amount;
  final String date;
  final List<CategoryModel> categories;
  const ExpenseModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.categories,
  });
}
